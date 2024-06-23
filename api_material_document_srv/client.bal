// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is auto-generated by the Ballerina OpenAPI tool.

// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.org).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerinax/sap;

#

#

# This service enables you to retrieve and create material documents, for example, to post a goods receipt for a purchase order or to document the transfer of materials between two storage locations. Additionally, the service allows you to cancel existing material documents or single items. It can be consumed by external systems and user interfaces.
public isolated client class Client {
    final sap:Client clientEp;

    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string hostname, int port = 443) returns error? {
        string serviceUrl = string `https://${hostname}:${port}/API_MATERIAL_DOCUMENT_SRV`;
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        sap:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }

    # Creates a material document
    #
    # + headers - Headers to be sent with the request 
    # + payload - New entity 
    # + return - Created entity 
    remote isolated function createA_MaterialDocumentHeader(CreateA_MaterialDocumentHeader payload, map<string|string[]> headers = {}) returns A_MaterialDocumentHeaderType|error {
        string resourcePath = string `/A_MaterialDocumentHeader`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Cancels a material document
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Success 
    remote isolated function createCancel(map<string|string[]> headers = {}, *CreateCancelQueries queries) returns A_MaterialDocumentHeaderType|error {
        string resourcePath = string `/Cancel`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Cancels a material document item
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Success 
    remote isolated function createCancelItem(map<string|string[]> headers = {}, *CreateCancelItemQueries queries) returns A_MaterialDocumentItemType|error {
        string resourcePath = string `/CancelItem`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Reads information for a specific material document header
    #
    # + MaterialDocumentYear - Material Document Year
    # + MaterialDocument - Number of Material Document
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entity 
    remote isolated function getA_MaterialDocumentHeader(string MaterialDocumentYear, string MaterialDocument, map<string|string[]> headers = {}, *GetA_MaterialDocumentHeaderQueries queries) returns A_MaterialDocumentHeaderType|error {
        string resourcePath = string `/A_MaterialDocumentHeader(MaterialDocumentYear='${getEncodedUri(MaterialDocumentYear)}',MaterialDocument='${getEncodedUri(MaterialDocument)}')`;
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Reads information on material document items level for a specific material document
    #
    # + MaterialDocumentYear - Material Document Year
    # + MaterialDocument - Number of Material Document
    # + MaterialDocumentItem - Material Document Item
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entity 
    remote isolated function getA_MaterialDocumentItem(string MaterialDocumentYear, string MaterialDocument, string MaterialDocumentItem, map<string|string[]> headers = {}, *GetA_MaterialDocumentItemQueries queries) returns A_MaterialDocumentItemType|error {
        string resourcePath = string `/A_MaterialDocumentItem(MaterialDocumentYear='${getEncodedUri(MaterialDocumentYear)}',MaterialDocument='${getEncodedUri(MaterialDocument)}',MaterialDocumentItem='${getEncodedUri(MaterialDocumentItem)}')`;
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Reads information of serial number on material document item level for a specific material document, item, year and material
    #
    # + Material - Material Number
    # + SerialNumber - Serial Number
    # + MaterialDocument - Number of Material Document
    # + MaterialDocumentItem - Material Document Item
    # + MaterialDocumentYear - Material Document Year
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entity 
    remote isolated function getA_SerialNumberMaterialDocument(string Material, string SerialNumber, string MaterialDocument, string MaterialDocumentItem, string MaterialDocumentYear, map<string|string[]> headers = {}, *GetA_SerialNumberMaterialDocumentQueries queries) returns A_SerialNumberMaterialDocumentType|error {
        string resourcePath = string `/A_SerialNumberMaterialDocument(Material='${getEncodedUri(Material)}',SerialNumber='${getEncodedUri(SerialNumber)}',MaterialDocument='${getEncodedUri(MaterialDocument)}',MaterialDocumentItem='${getEncodedUri(MaterialDocumentItem)}',MaterialDocumentYear='${getEncodedUri(MaterialDocumentYear)}')`;
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Reads information on material document item and header level for a specific material document item
    #
    # + MaterialDocumentYear - Material Document Year
    # + MaterialDocument - Number of Material Document
    # + MaterialDocumentItem - Material Document Item
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entity 
    remote isolated function getMaterialDocumentHeaderOfA_MaterialDocumentItem(string MaterialDocumentYear, string MaterialDocument, string MaterialDocumentItem, map<string|string[]> headers = {}, *GetMaterialDocumentHeaderOfA_MaterialDocumentItemQueries queries) returns A_MaterialDocumentHeaderType|error {
        string resourcePath = string `/A_MaterialDocumentItem(MaterialDocumentYear='${getEncodedUri(MaterialDocumentYear)}',MaterialDocument='${getEncodedUri(MaterialDocument)}',MaterialDocumentItem='${getEncodedUri(MaterialDocumentItem)}')/to_MaterialDocumentHeader`;
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Reads information on material document header level
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entities 
    remote isolated function listA_MaterialDocumentHeaders(map<string|string[]> headers = {}, *ListA_MaterialDocumentHeadersQueries queries) returns Wrapper|error {
        string resourcePath = string `/A_MaterialDocumentHeader`;
        map<Encoding> queryParamEncoding = {"$orderby": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Reads information on material document items level
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entities 
    remote isolated function listA_MaterialDocumentItems(map<string|string[]> headers = {}, *ListA_MaterialDocumentItemsQueries queries) returns Wrapper_1|error {
        string resourcePath = string `/A_MaterialDocumentItem`;
        map<Encoding> queryParamEncoding = {"$orderby": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Reads information of serial numbers on material document items level
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entities 
    remote isolated function listA_SerialNumberMaterialDocuments(map<string|string[]> headers = {}, *ListA_SerialNumberMaterialDocumentsQueries queries) returns Wrapper_2|error {
        string resourcePath = string `/A_SerialNumberMaterialDocument`;
        map<Encoding> queryParamEncoding = {"$orderby": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Reads information for a specific material document header and material document items
    #
    # + MaterialDocumentYear - Material Document Year
    # + MaterialDocument - Number of Material Document
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entities 
    remote isolated function listMaterialDocumentItemsOfA_MaterialDocumentHeader(string MaterialDocumentYear, string MaterialDocument, map<string|string[]> headers = {}, *ListMaterialDocumentItemsOfA_MaterialDocumentHeaderQueries queries) returns Wrapper_1|error {
        string resourcePath = string `/A_MaterialDocumentHeader(MaterialDocumentYear='${getEncodedUri(MaterialDocumentYear)}',MaterialDocument='${getEncodedUri(MaterialDocument)}')/to_MaterialDocumentItem`;
        map<Encoding> queryParamEncoding = {"$orderby": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}, "$expand": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Reads information on serial numbers for a specific material document item
    #
    # + MaterialDocumentYear - Material Document Year
    # + MaterialDocument - Number of Material Document
    # + MaterialDocumentItem - Material Document Item
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entities 
    remote isolated function listSerialNumberssOfA_MaterialDocumentItem(string MaterialDocumentYear, string MaterialDocument, string MaterialDocumentItem, map<string|string[]> headers = {}, *ListSerialNumberssOfA_MaterialDocumentItemQueries queries) returns Wrapper_2|error {
        string resourcePath = string `/A_MaterialDocumentItem(MaterialDocumentYear='${getEncodedUri(MaterialDocumentYear)}',MaterialDocument='${getEncodedUri(MaterialDocument)}',MaterialDocumentItem='${getEncodedUri(MaterialDocumentItem)}')/to_SerialNumbers`;
        map<Encoding> queryParamEncoding = {"$orderby": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Send a group of requests
    #
    # + headers - Headers to be sent with the request 
    # + request - Batch request 
    # + return - Batch response 
    remote isolated function performBatchOperation(http:Request request, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/$batch`;
        // TODO: Update the request as needed;
        return self.clientEp->post(resourcePath, request, headers);
    }
}
