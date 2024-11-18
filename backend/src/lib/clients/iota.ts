import {
  Configuration,
  ConfigurationsApi,
  FetchIOTAVPResponseOK,
  IotaApi,
  IotaConfigurationDtoModeEnum,
  PexQueryApi,
} from "@affinidi-tdk/iota-client";
import { getAuthProvider } from "./auth-provider";
import { v4 as uuidv4 } from "uuid";

export async function listIotaConfigurations() {
  const authProvider = getAuthProvider();
  const api = new ConfigurationsApi(
    new Configuration({
      apiKey: authProvider.fetchProjectScopedToken.bind(authProvider),
    }),
  );
  const { data } = await api.listIotaConfigurations();
  return data.configurations;
}

export async function listPexQueriesByConfigurationId(configurationId: string) {
  const authProvider = getAuthProvider();
  const api = new PexQueryApi(
    new Configuration({
      apiKey: authProvider.fetchProjectScopedToken.bind(authProvider),
    }),
  );
  const { data } = await api.listPexQueries(configurationId);
  return data.pexQueries;
}

export async function initiateIotaRequest(configurationId: string, queryId: string, nonce: string, redirectUri: string) {
  const authProvider = getAuthProvider();
  const api = new IotaApi(
    new Configuration({
      apiKey: authProvider.fetchProjectScopedToken.bind(authProvider),
    })
  );
  const { data: dataSharingRequestResponse } =
    await api.initiateDataSharingRequest({
      configurationId,
      mode: IotaConfigurationDtoModeEnum.Redirect,
      queryId,
      correlationId: uuidv4(),
      nonce,
      redirectUri,
    });
  return dataSharingRequestResponse.data;
}


export async function fetchIotaVpResponse(responseCode: string, configurationId: string, correlationId: string, transactionId: string) {
  const authProvider = getAuthProvider();
  const api = new IotaApi(
    new Configuration({
      apiKey: authProvider.fetchProjectScopedToken.bind(authProvider),
    })
  );
  const iotaVpResponse: FetchIOTAVPResponseOK =
    await api.fetchIotaVpResponse({
      configurationId,
      correlationId,
      transactionId,
      responseCode,
    });

  return iotaVpResponse.data;
}
