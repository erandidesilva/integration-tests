package resources.services;

import ballerina.data.sql;
import resources.connectorInit as conn;

function deleteWithParams (string query, string valueToBeDeleted) (int, error){

    endpoint<sql:ClientConnector> ep{
        conn:init();
    }
    sql:Parameter[] parameters = [];
    error err;
    int noOfRows;

    try {
        sql:Parameter para = {sqlType:"varchar", value:valueToBeDeleted, direction:0};
        parameters = [para];
        noOfRows = ep.update(query, parameters);
    } catch (error e) {
        err = e;
    }
    return noOfRows, err;
}

function deleteGeneral (string query) (int, error){

    endpoint<sql:ClientConnector> ep{
        conn:init();
    }
    sql:Parameter[] parameters = [];
    error err;
    int noOfRows;

    try {
        noOfRows = ep.update (query, parameters);
    } catch (error e) {
        err = e;
    }
    return noOfRows, err;
}