#!/bin/sh
#script for database management
DB_USER="root";
DB_PASS="";

usage(){
    echo "Usage:";
    echo $0 "command [dbname, <dbtype>] [alterFile]";
    echo "\nCommands:";
    echo "--defaultinit                      creates general, association1, association2 using the default initializations";
    echo "-d --drop                         drop  <dbname> ";
    echo "-c --create                       create <dbType> ";
    echo "-p --populate                     populate <dbname> using default data>";
    echo "-a --alter                        alter <dbname> using script: <alterFile>";
    echo "-aa --alteAllAssociations     can be used for alltering all asociations using script: <alterFile>";
    echo "-s --showAssociatons              show available associations databases";
    echo "\ndbtype: association/general";
}
runQuery(){
    mysql -u $DB_USER -e "$1";
    if [ "$?" != "0" ]; then
	    exit 1
    fi
}
runScript(){
    if [ $2 ]; then
        mysql -u $DB_USER -D "$2" < "$1"  ;
    else
        mysql -u $DB_USER < "$1"  ;
    fi

    if [ "$?" != "0" ]; then
	    exit 1
    fi
}
alter(){
    echo "not implemented yet!!";
}
alterAssociations(){
    echo "not implemented yet";
}
createGeneral(){
    echo "Creting \`general\` database";
    runScript "createGeneral.sql"
}

createAssociation(){
        if [ "$7" != "" ]; then
            ID_ASSOCIATION=$1;
            NAME=$2;
            CUI=$3
            COUNTY=$4
            CITY=$5
            NOA=$6
            ADDRESS=$7
        else
            echo "NOTE: Please make sure that \`general\` database was previousely created!";
            ID_ASSOCIATION=`runQuery "select MAX(idassociation) from general.association" | tr -dc '[0-9]'`;
            ID_ASSOCIATION=`expr $ID_ASSOCIATION + 1`;
            echo -n "(char[45]) name = ";
            read -r NAME;
            echo -n "(char[13]) cui = ";
            read -r CUI;
            echo -n "(char[20]) county = ";
            read -r COUNTY;
            echo -n "(char[25]) city = ";
            read -r CITY;
            echo -n "(unsigned int) number_of_apartments = ";
            read -r NOA;
            echo -n "(char[50]) address = ";
            read -r ADDRESS;
        fi
        echo "Creating association$ID_ASSOCIATION";
        QUERY="INSERT INTO \`general\`.\`association\` (\`idassociation\`, \`name\`, \`cui\`, \`county\`, \`city\`, \`number_of_apartments\`, \`address\`)";
        QUERY=$QUERY" VALUES ('$ID_ASSOCIATION', '$NAME', '$CUI', '$COUNTY', '$CITY', '$NOA', '$ADDRESS')";
        runQuery "$QUERY";
        echo " -> data was inserted in general.association table";
        runQuery "create schema association$ID_ASSOCIATION"
        echo " -> association$ID_ASSOCIATION schema created";
        runScript "createAssociation.sql" "association$ID_ASSOCIATION";
        echo "Dne";
}
populateAssociation(){
    echo "Populating  \`$1\` database with default data";
    runScript "populateAssociation.sql" "$1"
    echo "Dne";
}
populateGeneral(){
    echo "Populating  \`general\` database with default data";
    runScript "populateGeneral.sql"
    echo "Dne";
}

defaultInit(){
    createGeneral;
    populateGeneral;
    createAssociation "1" "Asociatia De Proprietari Nr. 1" "1234567890123" "Hunedoara" "Deva" "123" "Bld. Decebal, Bl. M, Sc. C, Ap.92";
    createAssociation "2" "Asociatia De Proprietari Nr. 1" "1234567890124" "Timis" "Timisoara" "50" "Bld. Parvan, Bl. R, Sc. C, Ap.12";
        runQuery "INSERT INTO \`general\`.\`user_has_association\` (\`user_iduser\`, \`association_idassociation\`, \`roles\`) VALUES ('1', '1', '2')";
    runQuery "INSERT INTO \`general\`.\`user_has_association\` (\`user_iduser\`, \`association_idassociation\`, \`roles\`) VALUES ('1', '2', '2')";
    runQuery "INSERT INTO \`general\`.\`user_has_association\` (\`user_iduser\`, \`association_idassociation\`, \`roles\`) VALUES ('2', '1', '2')";
    populateAssociation "association1";
    populateAssociation "association2";
    #add administrator roles

}
case "$1" in
""|"-help")
    usage;
    ;;
"--defaultinit")
        echo "running default database init"
        defaultInit;
        echo "Dne";
    ;;
"-d"|"--drop")
    echo "Droping schema: $2";
    runQuery "drop schema $2";
    case "$2" in
    association*[0-9])
        ID=`echo "$2" | tr -d '[:alpha:]'`
        runQuery "DELETE FROM \`general\`.\`association\` WHERE \`idassociation\`='$ID'";
    ;;
    esac;
    echo "Dne";
    ;;
"-c"|"--create")
    case $2 in
    "general")
        createGeneral;
        ;;
    "association")
        createAssociation;
        ;;
    *)
    echo "invalid dbtype";
    ;;
    esac;
    ;;
"-s"|"--showAssociations")
    echo "Associations database names are formed usnig \"association<idassociation>\"\n Ex: dbname = association1 for idassociation = 1"
    runQuery "select * from general.association";
    ;;
"-a"|"--alter")
    alter;
    ;;
"-aa"|"--alteAllAssociations")
    alterAssociations;
    ;;
"-p"|"--populate")
    case $2 in
    "general")
        populateGeneral;
        ;;
    association*[0-9])
        populateAssociation $2;
        ;;
    *)
        echo "invalid database";
        ;;
    esac;
    ;;
*)
    echo "Invalid parameter please run: $0 -help";
    ;;
esac;