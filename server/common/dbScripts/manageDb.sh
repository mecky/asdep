#!/bin/bash

ASSOC_NAME="association1"

# create associatiegeneric
mysql -u root < create-associationgeneric.sql

# create and populate general
mysql -u root < create-general.sql
mysql -u root < init-general.sql

# add a new association
mysqldump -u root --no-data asociatiegeneric > association
mysql -u root -e "create schema $ASSOC_NAME"
mysql -u root $ASSOC_NAME < association
mysql -u root $ASSOC_NAME < init-association.sql

rm association

