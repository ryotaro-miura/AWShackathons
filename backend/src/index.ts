// backend/src/index.ts
import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { 
  APIGatewayProxyEventV2, 
  APIGatewayProxyResult 
} from "aws-lambda";
import {
  DynamoDBDocumentClient,
} from "@aws-sdk/lib-dynamodb";
import { createBook } from "./utils/createBook";
// import { getBook } from "./utils/getBook";
// import { updateBook } from "./utils/updateBook";
// import { deleteBook } from "./utils/deleteBook";
// import { listBooks } from "./utils/listBooks";

const dynamoDbClient = new DynamoDBClient({});
const dynamo = DynamoDBDocumentClient.from(dynamoDbClient, {
  marshallOptions: {
    convertClassInstanceToMap: true, // クラスインスタンスをMapに変換
    removeUndefinedValues: true, // undefinedを除去
  },
});
const tableName = "Book-manager";
export const handler = async (event: APIGatewayProxyEventV2): Promise<APIGatewayProxyResult> => {
  const route = event.routeKey;
  try {
    // ルーティング
    switch (route) {
      case "POST /books":
        return await createBook(event, dynamo, tableName);
      
    //   case "GET /books/{bookId}":
    //     return await getBook(event, dynamoDbClient);
      
    //   case "PUT /books/{bookId}":
    //     return await updateBook(event, dynamoDbClient);
      
    //   case "DELETE /books/{bookId}":
    //     return await deleteBook(event, dynamoDbClient);
      
    //   case "GET /books":
    //     return await listBooks(event, dynamoDbClient);
      
    //TODO：それぞれの関数でエラーを定義する可能性があるため、共通化を検討
      default:
        return {
          statusCode: 404,
          body: JSON.stringify({
            message: `Route not found: ${route}`,
          }),
        };
    }
  } catch (error) {
    console.error("Error:", error);
    return {
      statusCode: 500,
      body: JSON.stringify({
        message: "Internal server error",
        error: error instanceof Error ? error.message : "Unknown error",
      }),
    };
  }
};