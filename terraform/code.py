import json
import boto3
from datetime import datetime, date

def lambda_handler(event, context):
    

    now = datetime.now()
    dateTime = now.strftime("%d/%m/%Y %H:%M:%S")

    ses = boto3.client('ses')
    s3 = boto3.client('s3')
    key = event['Records'][0]['s3']['object']['key']
    env = ""
    
    if "dev" in key:
        env = "development environment"
    elif "prod" in key:
    	env = "production environment"
    else:
    	env = "default environment"
	
	
    body = f"""
	    There was a change in infrastructure in {env} {dateTime}.
    """

    ses.send_email(
	    Source = 'marwaezzat201@gmail.com',
	    Destination = {
		    'ToAddresses': [
			    'marwaezzat201@gmail.com'
		    ]
	    },
	    Message = {
		    'Subject': {
			    'Data': 'SES Demo',
			    'Charset': 'UTF-8'
		    },
		    'Body': {
			    'Text':{
				    'Data': body,
				    'Charset': 'UTF-8'
			    }
		    }
	    }
    )
    
    return {
        'statusCode': 200,
        'body': json.dumps('Successfully sent email from Lambda using Amazon SES')
    }
