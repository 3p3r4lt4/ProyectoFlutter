enum ClientError {
  tokenNoFound,
  invalidToken,
  clientDuplicated,
  clientWithDocuments,
  shortDocument,
  documentNoFound,
  tryAgainLater,
  unknown
}

Map<ClientError, String> clientErrorToString = {
  ClientError.invalidToken: 'Se requiere un token para la autenticación',
  ClientError.tokenNoFound: 'Token Invalido',
  ClientError.clientDuplicated: 'El cliente ya se encuentra registrado',
  ClientError.clientWithDocuments: 'No se puede eliminar cliente. Tiene documentos(s) asignado(s).',
  ClientError.shortDocument: 'El número de documento debe tener minimo 8 caracteres.',
  ClientError.documentNoFound: 'No se encontró el documento. Revise si el número de documento es correcto.',
  ClientError.unknown: 'Error desconocido',
  ClientError.tryAgainLater: 'No se encontró el documento. Intentalo más tarde.',
};

ClientError parseStringToClientError(String code) {
  switch (code) {
    case "Se requiere un token para la autenticación":
      return ClientError.tokenNoFound;
    case "Token Invalido":
      return ClientError.invalidToken;
    case "El cliente ya se encuentra registrado":
      return ClientError.clientDuplicated;
    case "No se puede eliminar cliente. Tiene documentos(s) asignado(s).":
      return ClientError.clientWithDocuments;
    case "El número de documento debe tener minimo 8 caracteres.":
      return ClientError.shortDocument;
    case "No se encontró el documento. Revise si el número de documento es correcto.":
      return ClientError.documentNoFound;
    case "No se encontró el documento. Intentalo más tarde.":
      return ClientError.tryAgainLater;
    default:
      return ClientError.unknown;
  }
}