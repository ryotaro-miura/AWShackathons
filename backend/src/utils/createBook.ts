import {
  DynamoDBDocumentClient,
  PutCommand,
} from '@aws-sdk/lib-dynamodb';
import { randomUUID } from "crypto";
import { APIGatewayProxyEventV2, APIGatewayProxyResult } from 'aws-lambda';

export const createBook = async (  event: APIGatewayProxyEventV2,dynamo:DynamoDBDocumentClient, tableName: string): Promise<APIGatewayProxyResult> => {
  try {
    if(!event.body){throw new Error('event.body is not defined');}
    const body = JSON.parse(event.body);
    const { userId, title, author, category, rating, readDate, memo } = body;
    
    // バリデーション
    if (!userId || !title || !author || !category) {
      return {
        statusCode: 400,
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ message: "必須項目不足" })
      };
    }
    
    const bookId = randomUUID();
    const now = new Date().toISOString();
    const sortKey = `${category}#${bookId}`;
    
    const item = {
      userId,
      sortKey,
      title,
      author,
      category,
      rating: rating || 0,
      readDate: readDate || "",
      memo: memo || "",
      createdAt: now,
      updatedAt: now
    };
    
    await dynamo.send(new PutCommand({
      TableName: tableName,
      Item: item
    }));
    
    return {
      statusCode: 201,
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        bookId,
        ...item
      })
    };
    
  } catch (error) {
    console.error(error);
    return {
      statusCode: 500,
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ message: "サーバーエラー" })
    };
  }
};