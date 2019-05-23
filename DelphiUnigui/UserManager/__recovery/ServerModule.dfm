object UniServerModule: TUniServerModule
  OldCreateOrder = False
  TempFolder = 'temp\'
  Port = 8076
  Title = 'New Application'
  SuppressErrors = []
  Bindings = <>
  MainFormDisplayMode = mfPage
  CustomFiles.Strings = (
    'files/css/bootstrap.min.css'
    'files/js/bootstrap.min.js')
  CustomCSS.Strings = (
    '.undtuser_id{'
    '  border-style: none none groove none;'
    '  border-width: 0px;'
    '  border-color: #3EC4ED;  '
    '  #box-shadow: 0px 1px 3px #BEE2F9;'
    '  background-image: none;'
    '}')
  SSL.SSLOptions.RootCertFile = 'root.pem'
  SSL.SSLOptions.CertFile = 'cert.pem'
  SSL.SSLOptions.KeyFile = 'key.pem'
  SSL.SSLOptions.Method = sslvTLSv1_1
  SSL.SSLOptions.SSLVersions = [sslvTLSv1_1]
  SSL.SSLOptions.Mode = sslmUnassigned
  SSL.SSLOptions.VerifyMode = []
  SSL.SSLOptions.VerifyDepth = 0
  ConnectionFailureRecovery.ErrorMessage = 'Connection Error'
  ConnectionFailureRecovery.RetryMessage = 'Retrying...'
  Height = 150
  Width = 215
  object FDManager1: TFDManager
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 48
    Top = 40
  end
  object FDMoniCustomClientLink1: TFDMoniCustomClientLink
    Left = 128
    Top = 56
  end
  object fdqry1: TFDQuery
    Left = 80
    Top = 40
  end
end
