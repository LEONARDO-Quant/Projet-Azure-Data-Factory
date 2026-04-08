@secure()
param vulnerabilityAssessments_Default_storageContainerPath string
param servers_leoserveursda_name string = 'leoserveursda'
param storageAccounts_dlsda26leo_name string = 'dlsda26leo'

resource servers_leoserveursda_name_resource 'Microsoft.Sql/servers@2024-11-01-preview' = {
  name: servers_leoserveursda_name
  location: 'francecentral'
  kind: 'v12.0'
  properties: {
    administratorLogin: 'Leito'
    version: '12.0'
    minimalTlsVersion: '1.2'
    publicNetworkAccess: 'Enabled'
    administrators: {
      administratorType: 'ActiveDirectory'
      principalType: 'User'
      login: 'obleonardoze@univ-paris1.fr'
      sid: '6e99c095-9566-4979-8f0e-721aeb4f27c3'
      tenantId: '8c6f9078-037e-4261-a583-52a944e55f7f'
      azureADOnlyAuthentication: false
    }
    restrictOutboundNetworkAccess: 'Disabled'
    retentionDays: -1
  }
}

resource storageAccounts_dlsda26leo_name_resource 'Microsoft.Storage/storageAccounts@2025-06-01' = {
  name: storageAccounts_dlsda26leo_name
  location: 'francecentral'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    dualStackEndpointPreference: {
      publishIpv6Endpoint: false
    }
    dnsEndpointType: 'Standard'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    allowCrossTenantReplication: false
    isLocalUserEnabled: true
    isSftpEnabled: true
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    allowSharedKeyAccess: true
    isHnsEnabled: true
    networkAcls: {
      ipv6Rules: []
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      requireInfrastructureEncryption: false
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource servers_leoserveursda_name_ActiveDirectory 'Microsoft.Sql/servers/administrators@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'ActiveDirectory'
  properties: {
    administratorType: 'ActiveDirectory'
    login: 'obleonardoze@univ-paris1.fr'
    sid: '6e99c095-9566-4979-8f0e-721aeb4f27c3'
    tenantId: '8c6f9078-037e-4261-a583-52a944e55f7f'
  }
}

resource servers_leoserveursda_name_Default 'Microsoft.Sql/servers/advancedThreatProtectionSettings@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource servers_leoserveursda_name_CreateIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_leoserveursda_name_resource
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_leoserveursda_name_DbParameterization 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_leoserveursda_name_resource
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_leoserveursda_name_DefragmentIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_leoserveursda_name_resource
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_leoserveursda_name_DropIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_leoserveursda_name_resource
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_leoserveursda_name_ForceLastGoodPlan 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_leoserveursda_name_resource
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
}

resource Microsoft_Sql_servers_auditingPolicies_servers_leoserveursda_name_Default 'Microsoft.Sql/servers/auditingPolicies@2014-04-01' = {
  parent: servers_leoserveursda_name_resource
  name: 'Default'
  location: 'France Central'
  properties: {
    auditingState: 'Disabled'
  }
}

resource Microsoft_Sql_servers_auditingSettings_servers_leoserveursda_name_Default 'Microsoft.Sql/servers/auditingSettings@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource Microsoft_Sql_servers_azureADOnlyAuthentications_servers_leoserveursda_name_Default 'Microsoft.Sql/servers/azureADOnlyAuthentications@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'Default'
  properties: {
    azureADOnlyAuthentication: false
  }
}

resource Microsoft_Sql_servers_connectionPolicies_servers_leoserveursda_name_default 'Microsoft.Sql/servers/connectionPolicies@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'default'
  location: 'francecentral'
  properties: {
    connectionType: 'Default'
  }
}

resource servers_leoserveursda_name_dbsda26 'Microsoft.Sql/servers/databases@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'dbsda26'
  location: 'francecentral'
  sku: {
    name: 'GP_S_Gen5'
    tier: 'GeneralPurpose'
    family: 'Gen5'
    capacity: 1
  }
  kind: 'v12.0,user,vcore,serverless,freelimit'
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 34359738368
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    autoPauseDelay: 60
    requestedBackupStorageRedundancy: 'Local'
    minCapacity: json('0.5')
    maintenanceConfigurationId: '/subscriptions/60360b3c-9c5b-47f0-a0cb-5c4f463d4797/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
    useFreeLimit: true
    freeLimitExhaustionBehavior: 'BillOverUsage'
    availabilityZone: 'NoPreference'
  }
}

resource servers_leoserveursda_name_master_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2024-11-01-preview' = {
  name: '${servers_leoserveursda_name}/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingPolicies_servers_leoserveursda_name_master_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  name: '${servers_leoserveursda_name}/master/Default'
  location: 'France Central'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_leoserveursda_name_master_Default 'Microsoft.Sql/servers/databases/auditingSettings@2024-11-01-preview' = {
  name: '${servers_leoserveursda_name}/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_leoserveursda_name_master_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2024-11-01-preview' = {
  name: '${servers_leoserveursda_name}/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_leoserveursda_name_master_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2024-11-01-preview' = {
  name: '${servers_leoserveursda_name}/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource servers_leoserveursda_name_master_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2024-11-01-preview' = {
  name: '${servers_leoserveursda_name}/master/Current'
  properties: {}
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_leoserveursda_name_master_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2024-11-01-preview' = {
  name: '${servers_leoserveursda_name}/master/Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_leoserveursda_name_master_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2024-11-01-preview' = {
  name: '${servers_leoserveursda_name}/master/Current'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_leoserveursda_name_master_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2024-11-01-preview' = {
  name: '${servers_leoserveursda_name}/master/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource Microsoft_Sql_servers_devOpsAuditingSettings_servers_leoserveursda_name_Default 'Microsoft.Sql/servers/devOpsAuditingSettings@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'Default'
  properties: {
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_leoserveursda_name_current 'Microsoft.Sql/servers/encryptionProtector@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'current'
  kind: 'servicemanaged'
  properties: {
    serverKeyName: 'ServiceManaged'
    serverKeyType: 'ServiceManaged'
    autoRotationEnabled: false
  }
}

resource Microsoft_Sql_servers_extendedAuditingSettings_servers_leoserveursda_name_Default 'Microsoft.Sql/servers/extendedAuditingSettings@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_leoserveursda_name_AllowAllWindowsAzureIps 'Microsoft.Sql/servers/firewallRules@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'AllowAllWindowsAzureIps'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}

resource servers_leoserveursda_name_ClientIp_2026_2_24_7_29_23 'Microsoft.Sql/servers/firewallRules@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'ClientIp-2026-2-24_7-29-23'
  properties: {
    startIpAddress: '46.193.66.171'
    endIpAddress: '46.193.66.171'
  }
}

resource servers_leoserveursda_name_ClientIPAddress_2026_02_27_13_11_03 'Microsoft.Sql/servers/firewallRules@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'ClientIPAddress_2026-02-27_13-11-03'
  properties: {
    startIpAddress: '78.242.34.206'
    endIpAddress: '78.242.34.206'
  }
}

resource servers_leoserveursda_name_ClientIPAddress_2026_02_27_16_30_38 'Microsoft.Sql/servers/firewallRules@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'ClientIPAddress_2026-02-27_16-30-38'
  properties: {
    startIpAddress: '78.241.152.225'
    endIpAddress: '78.241.152.225'
  }
}

resource servers_leoserveursda_name_ClientIPAddress_2026_04_01_13_14_17 'Microsoft.Sql/servers/firewallRules@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'ClientIPAddress_2026-04-01_13-14-17'
  properties: {
    startIpAddress: '176.140.213.251'
    endIpAddress: '176.140.213.251'
  }
}

resource servers_leoserveursda_name_ClientIPAddress_2026_04_01_19_40_47 'Microsoft.Sql/servers/firewallRules@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'ClientIPAddress_2026-04-01_19-40-47'
  properties: {
    startIpAddress: '176.140.209.67'
    endIpAddress: '176.140.209.67'
  }
}

resource servers_leoserveursda_name_ClientIPAddress_2026_04_02_19_29_57 'Microsoft.Sql/servers/firewallRules@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'ClientIPAddress_2026-04-02_19-29-57'
  properties: {
    startIpAddress: '176.191.83.240'
    endIpAddress: '176.191.83.240'
  }
}

resource servers_leoserveursda_name_ServiceManaged 'Microsoft.Sql/servers/keys@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'ServiceManaged'
  kind: 'servicemanaged'
  properties: {
    serverKeyType: 'ServiceManaged'
  }
}

resource Microsoft_Sql_servers_securityAlertPolicies_servers_leoserveursda_name_Default 'Microsoft.Sql/servers/securityAlertPolicies@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
}

resource Microsoft_Sql_servers_sqlVulnerabilityAssessments_servers_leoserveursda_name_Default 'Microsoft.Sql/servers/sqlVulnerabilityAssessments@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource Microsoft_Sql_servers_vulnerabilityAssessments_servers_leoserveursda_name_Default 'Microsoft.Sql/servers/vulnerabilityAssessments@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_resource
  name: 'Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
    storageContainerPath: vulnerabilityAssessments_Default_storageContainerPath
  }
}

resource storageAccounts_dlsda26leo_name_default 'Microsoft.Storage/storageAccounts/blobServices@2025-06-01' = {
  parent: storageAccounts_dlsda26leo_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_dlsda26leo_name_default 'Microsoft.Storage/storageAccounts/fileServices@2025-06-01' = {
  parent: storageAccounts_dlsda26leo_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_dlsda26leo_name_default 'Microsoft.Storage/storageAccounts/queueServices@2025-06-01' = {
  parent: storageAccounts_dlsda26leo_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_dlsda26leo_name_default 'Microsoft.Storage/storageAccounts/tableServices@2025-06-01' = {
  parent: storageAccounts_dlsda26leo_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource servers_leoserveursda_name_dbsda26_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_dbsda26
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingPolicies_servers_leoserveursda_name_dbsda26_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_leoserveursda_name_dbsda26
  name: 'Default'
  location: 'France Central'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_leoserveursda_name_dbsda26_Default 'Microsoft.Sql/servers/databases/auditingSettings@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_dbsda26
  name: 'Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_leoserveursda_name_dbsda26_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_dbsda26
  name: 'default'
  properties: {
    timeBasedImmutability: 'Disabled'
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_leoserveursda_name_dbsda26_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_dbsda26
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 12
  }
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_leoserveursda_name_dbsda26_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_dbsda26
  name: 'Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_leoserveursda_name_dbsda26_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_dbsda26
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource servers_leoserveursda_name_dbsda26_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_dbsda26
  name: 'Current'
  properties: {}
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_leoserveursda_name_dbsda26_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_dbsda26
  name: 'Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_leoserveursda_name_dbsda26_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_dbsda26
  name: 'Current'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_leoserveursda_name_dbsda26_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2024-11-01-preview' = {
  parent: servers_leoserveursda_name_dbsda26
  name: 'Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_leoserveursda_name_resource
  ]
}

resource storageAccounts_dlsda26leo_name_default_bankia_data 'Microsoft.Storage/storageAccounts/blobServices/containers@2025-06-01' = {
  parent: storageAccounts_dlsda26leo_name_default
  name: 'bankia-data'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_dlsda26leo_name_resource
  ]
}
