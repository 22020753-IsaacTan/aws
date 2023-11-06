//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSConnectResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSConnectResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSConnectResources

+ (instancetype)sharedInstance {
    static AWSConnectResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSConnectResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2017-08-08\",\
    \"endpointPrefix\":\"connect\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"rest-json\",\
    \"serviceAbbreviation\":\"Amazon Connect\",\
    \"serviceFullName\":\"Amazon Connect Service\",\
    \"serviceId\":\"Connect\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"connect\",\
    \"uid\":\"connect-2017-08-08\"\
  },\
  \"operations\":{\
    \"ActivateEvaluationForm\":{\
      \"name\":\"ActivateEvaluationForm\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/evaluation-forms/{InstanceId}/{EvaluationFormId}/activate\"\
      },\
      \"input\":{\"shape\":\"ActivateEvaluationFormRequest\"},\
      \"output\":{\"shape\":\"ActivateEvaluationFormResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Activates an evaluation form in the specified Amazon Connect instance. After the evaluation form is activated, it is available to start new evaluations based on the form. </p>\"\
    },\
    \"AssociateApprovedOrigin\":{\
      \"name\":\"AssociateApprovedOrigin\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance/{InstanceId}/approved-origin\"\
      },\
      \"input\":{\"shape\":\"AssociateApprovedOriginRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Associates an approved origin to an Amazon Connect instance.</p>\"\
    },\
    \"AssociateBot\":{\
      \"name\":\"AssociateBot\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance/{InstanceId}/bot\"\
      },\
      \"input\":{\"shape\":\"AssociateBotRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Allows the specified Amazon Connect instance to access the specified Amazon Lex or Amazon Lex V2 bot.</p>\"\
    },\
    \"AssociateDefaultVocabulary\":{\
      \"name\":\"AssociateDefaultVocabulary\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/default-vocabulary/{InstanceId}/{LanguageCode}\"\
      },\
      \"input\":{\"shape\":\"AssociateDefaultVocabularyRequest\"},\
      \"output\":{\"shape\":\"AssociateDefaultVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Associates an existing vocabulary as the default. Contact Lens for Amazon Connect uses the vocabulary in post-call and real-time analysis sessions for the given language.</p>\"\
    },\
    \"AssociateInstanceStorageConfig\":{\
      \"name\":\"AssociateInstanceStorageConfig\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance/{InstanceId}/storage-config\"\
      },\
      \"input\":{\"shape\":\"AssociateInstanceStorageConfigRequest\"},\
      \"output\":{\"shape\":\"AssociateInstanceStorageConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Associates a storage resource type for the first time. You can only associate one type of storage configuration in a single call. This means, for example, that you can't define an instance with multiple S3 buckets for storing chat transcripts.</p> <p>This API does not create a resource that doesn't exist. It only associates it to the instance. Ensure that the resource being specified in the storage configuration, like an S3 bucket, exists when being used for association.</p>\"\
    },\
    \"AssociateLambdaFunction\":{\
      \"name\":\"AssociateLambdaFunction\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance/{InstanceId}/lambda-function\"\
      },\
      \"input\":{\"shape\":\"AssociateLambdaFunctionRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Allows the specified Amazon Connect instance to access the specified Lambda function.</p>\"\
    },\
    \"AssociateLexBot\":{\
      \"name\":\"AssociateLexBot\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance/{InstanceId}/lex-bot\"\
      },\
      \"input\":{\"shape\":\"AssociateLexBotRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Allows the specified Amazon Connect instance to access the specified Amazon Lex V1 bot. This API only supports the association of Amazon Lex V1 bots.</p>\"\
    },\
    \"AssociatePhoneNumberContactFlow\":{\
      \"name\":\"AssociatePhoneNumberContactFlow\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/phone-number/{PhoneNumberId}/contact-flow\"\
      },\
      \"input\":{\"shape\":\"AssociatePhoneNumberContactFlowRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Associates a flow with a phone number claimed to your Amazon Connect instance.</p> <important> <p>If the number is claimed to a traffic distribution group, and you are calling this API using an instance in the Amazon Web Services Region where the traffic distribution group was created, you can use either a full phone number ARN or UUID value for the <code>PhoneNumberId</code> URI request parameter. However, if the number is claimed to a traffic distribution group and you are calling this API using an instance in the alternate Amazon Web Services Region associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p> </important>\"\
    },\
    \"AssociateQueueQuickConnects\":{\
      \"name\":\"AssociateQueueQuickConnects\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}/associate-quick-connects\"\
      },\
      \"input\":{\"shape\":\"AssociateQueueQuickConnectsRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Associates a set of quick connects with a queue.</p>\"\
    },\
    \"AssociateRoutingProfileQueues\":{\
      \"name\":\"AssociateRoutingProfileQueues\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}/{RoutingProfileId}/associate-queues\"\
      },\
      \"input\":{\"shape\":\"AssociateRoutingProfileQueuesRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Associates a set of queues with a routing profile.</p>\"\
    },\
    \"AssociateSecurityKey\":{\
      \"name\":\"AssociateSecurityKey\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance/{InstanceId}/security-key\"\
      },\
      \"input\":{\"shape\":\"AssociateSecurityKeyRequest\"},\
      \"output\":{\"shape\":\"AssociateSecurityKeyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Associates a security key to the instance.</p>\"\
    },\
    \"AssociateTrafficDistributionGroupUser\":{\
      \"name\":\"AssociateTrafficDistributionGroupUser\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/traffic-distribution-group/{TrafficDistributionGroupId}/user\"\
      },\
      \"input\":{\"shape\":\"AssociateTrafficDistributionGroupUserRequest\"},\
      \"output\":{\"shape\":\"AssociateTrafficDistributionGroupUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Associates an agent with a traffic distribution group.</p>\",\
      \"idempotent\":true\
    },\
    \"ClaimPhoneNumber\":{\
      \"name\":\"ClaimPhoneNumber\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/phone-number/claim\"\
      },\
      \"input\":{\"shape\":\"ClaimPhoneNumberRequest\"},\
      \"output\":{\"shape\":\"ClaimPhoneNumberResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"IdempotencyException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Claims an available phone number to your Amazon Connect instance or traffic distribution group. You can call this API only in the same Amazon Web Services Region where the Amazon Connect instance or traffic distribution group was created.</p> <p>For more information about how to use this operation, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/claim-phone-number.html\\\">Claim a phone number in your country</a> and <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/claim-phone-numbers-traffic-distribution-groups.html\\\">Claim phone numbers to traffic distribution groups</a> in the <i>Amazon Connect Administrator Guide</i>. </p> <important> <p>You can call the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_SearchAvailablePhoneNumbers.html\\\">SearchAvailablePhoneNumbers</a> API for available phone numbers that you can claim. Call the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribePhoneNumber.html\\\">DescribePhoneNumber</a> API to verify the status of a previous <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_ClaimPhoneNumber.html\\\">ClaimPhoneNumber</a> operation.</p> </important> <p>If you plan to claim and release numbers frequently during a 30 day period, contact us for a service quota exception. Otherwise, it is possible you will be blocked from claiming and releasing any more numbers until 30 days past the oldest number released has expired.</p> <p>By default you can claim and release up to 200% of your maximum number of active phone numbers during any 30 day period. If you claim and release phone numbers using the UI or API during a rolling 30 day cycle that exceeds 200% of your phone number service level quota, you will be blocked from claiming any more numbers until 30 days past the oldest number released has expired. </p> <p>For example, if you already have 99 claimed numbers and a service level quota of 99 phone numbers, and in any 30 day period you release 99, claim 99, and then release 99, you will have exceeded the 200% limit. At that point you are blocked from claiming any more numbers until you open an Amazon Web Services support ticket.</p>\"\
    },\
    \"CreateAgentStatus\":{\
      \"name\":\"CreateAgentStatus\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/agent-status/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateAgentStatusRequest\"},\
      \"output\":{\"shape\":\"CreateAgentStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Creates an agent status for the specified Amazon Connect instance.</p>\"\
    },\
    \"CreateContactFlow\":{\
      \"name\":\"CreateContactFlow\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/contact-flows/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateContactFlowRequest\"},\
      \"output\":{\"shape\":\"CreateContactFlowResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidContactFlowException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Creates a flow for the specified Amazon Connect instance.</p> <p>You can also create and update flows using the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/flow-language.html\\\">Amazon Connect Flow language</a>.</p>\"\
    },\
    \"CreateContactFlowModule\":{\
      \"name\":\"CreateContactFlowModule\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/contact-flow-modules/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateContactFlowModuleRequest\"},\
      \"output\":{\"shape\":\"CreateContactFlowModuleResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidContactFlowModuleException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"IdempotencyException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Creates a flow module for the specified Amazon Connect instance. </p>\"\
    },\
    \"CreateEvaluationForm\":{\
      \"name\":\"CreateEvaluationForm\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/evaluation-forms/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateEvaluationFormRequest\"},\
      \"output\":{\"shape\":\"CreateEvaluationFormResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates an evaluation form in the specified Amazon Connect instance. The form can be used to define questions related to agent performance, and create sections to organize such questions. Question and section identifiers cannot be duplicated within the same evaluation form.</p>\",\
      \"idempotent\":true\
    },\
    \"CreateHoursOfOperation\":{\
      \"name\":\"CreateHoursOfOperation\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/hours-of-operations/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateHoursOfOperationRequest\"},\
      \"output\":{\"shape\":\"CreateHoursOfOperationResponse\"},\
      \"errors\":[\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Creates hours of operation. </p>\"\
    },\
    \"CreateInstance\":{\
      \"name\":\"CreateInstance\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance\"\
      },\
      \"input\":{\"shape\":\"CreateInstanceRequest\"},\
      \"output\":{\"shape\":\"CreateInstanceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Initiates an Amazon Connect instance with all the supported channels enabled. It does not attach any storage, such as Amazon Simple Storage Service (Amazon S3) or Amazon Kinesis. It also does not allow for any configurations on features, such as Contact Lens for Amazon Connect. </p> <p>Amazon Connect enforces a limit on the total number of instances that you can create or delete in 30 days. If you exceed this limit, you will get an error message indicating there has been an excessive number of attempts at creating or deleting instances. You must wait 30 days before you can restart creating and deleting instances in your account.</p>\"\
    },\
    \"CreateIntegrationAssociation\":{\
      \"name\":\"CreateIntegrationAssociation\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance/{InstanceId}/integration-associations\"\
      },\
      \"input\":{\"shape\":\"CreateIntegrationAssociationRequest\"},\
      \"output\":{\"shape\":\"CreateIntegrationAssociationResponse\"},\
      \"errors\":[\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates an Amazon Web Services resource association with an Amazon Connect instance.</p>\"\
    },\
    \"CreateParticipant\":{\
      \"name\":\"CreateParticipant\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/create-participant\"\
      },\
      \"input\":{\"shape\":\"CreateParticipantRequest\"},\
      \"output\":{\"shape\":\"CreateParticipantResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Adds a new participant into an on-going chat contact. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/chat-customize-flow.html\\\">Customize chat flow experiences by integrating custom participants</a>.</p>\"\
    },\
    \"CreatePrompt\":{\
      \"name\":\"CreatePrompt\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/prompts/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreatePromptRequest\"},\
      \"output\":{\"shape\":\"CreatePromptResponse\"},\
      \"errors\":[\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Creates a prompt. For more information about prompts, such as supported file types and maximum length, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/prompts.html\\\">Create prompts</a> in the <i>Amazon Connect Administrator's Guide</i>.</p>\"\
    },\
    \"CreateQueue\":{\
      \"name\":\"CreateQueue\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/queues/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateQueueRequest\"},\
      \"output\":{\"shape\":\"CreateQueueResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Creates a new queue for the specified Amazon Connect instance.</p> <important> <p>If the number being used in the input is claimed to a traffic distribution group, and you are calling this API using an instance in the Amazon Web Services Region where the traffic distribution group was created, you can use either a full phone number ARN or UUID value for the <code>OutboundCallerIdNumberId</code> value of the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_OutboundCallerConfig\\\">OutboundCallerConfig</a> request body parameter. However, if the number is claimed to a traffic distribution group and you are calling this API using an instance in the alternate Amazon Web Services Region associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p> <p>Only use the phone number ARN format that doesn't contain <code>instance</code> in the path, for example, <code>arn:aws:connect:us-east-1:1234567890:phone-number/uuid</code>. This is the same ARN format that is returned when you call the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_ListPhoneNumbersV2.html\\\">ListPhoneNumbersV2</a> API.</p> </important>\"\
    },\
    \"CreateQuickConnect\":{\
      \"name\":\"CreateQuickConnect\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/quick-connects/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateQuickConnectRequest\"},\
      \"output\":{\"shape\":\"CreateQuickConnectResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Creates a quick connect for the specified Amazon Connect instance.</p>\"\
    },\
    \"CreateRoutingProfile\":{\
      \"name\":\"CreateRoutingProfile\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateRoutingProfileRequest\"},\
      \"output\":{\"shape\":\"CreateRoutingProfileResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Creates a new routing profile.</p>\"\
    },\
    \"CreateRule\":{\
      \"name\":\"CreateRule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/rules/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateRuleRequest\"},\
      \"output\":{\"shape\":\"CreateRuleResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates a rule for the specified Amazon Connect instance.</p> <p>Use the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/connect-rules-language.html\\\">Rules Function language</a> to code conditions for the rule. </p>\"\
    },\
    \"CreateSecurityProfile\":{\
      \"name\":\"CreateSecurityProfile\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/security-profiles/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateSecurityProfileRequest\"},\
      \"output\":{\"shape\":\"CreateSecurityProfileResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Creates a security profile.</p>\"\
    },\
    \"CreateTaskTemplate\":{\
      \"name\":\"CreateTaskTemplate\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance/{InstanceId}/task/template\"\
      },\
      \"input\":{\"shape\":\"CreateTaskTemplateRequest\"},\
      \"output\":{\"shape\":\"CreateTaskTemplateResponse\"},\
      \"errors\":[\
        {\"shape\":\"PropertyValidationException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Creates a new task template in the specified Amazon Connect instance.</p>\"\
    },\
    \"CreateTrafficDistributionGroup\":{\
      \"name\":\"CreateTrafficDistributionGroup\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/traffic-distribution-group\"\
      },\
      \"input\":{\"shape\":\"CreateTrafficDistributionGroupRequest\"},\
      \"output\":{\"shape\":\"CreateTrafficDistributionGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"ResourceNotReadyException\"}\
      ],\
      \"documentation\":\"<p>Creates a traffic distribution group given an Amazon Connect instance that has been replicated. </p> <p>For more information about creating traffic distribution groups, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/setup-traffic-distribution-groups.html\\\">Set up traffic distribution groups</a> in the <i>Amazon Connect Administrator Guide</i>. </p>\"\
    },\
    \"CreateUseCase\":{\
      \"name\":\"CreateUseCase\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance/{InstanceId}/integration-associations/{IntegrationAssociationId}/use-cases\"\
      },\
      \"input\":{\"shape\":\"CreateUseCaseRequest\"},\
      \"output\":{\"shape\":\"CreateUseCaseResponse\"},\
      \"errors\":[\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates a use case for an integration association.</p>\"\
    },\
    \"CreateUser\":{\
      \"name\":\"CreateUser\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/users/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateUserRequest\"},\
      \"output\":{\"shape\":\"CreateUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Creates a user account for the specified Amazon Connect instance.</p> <p>For information about how to create user accounts using the Amazon Connect console, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/user-management.html\\\">Add Users</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"CreateUserHierarchyGroup\":{\
      \"name\":\"CreateUserHierarchyGroup\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/user-hierarchy-groups/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateUserHierarchyGroupRequest\"},\
      \"output\":{\"shape\":\"CreateUserHierarchyGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Creates a new user hierarchy group.</p>\"\
    },\
    \"CreateVocabulary\":{\
      \"name\":\"CreateVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/vocabulary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateVocabularyRequest\"},\
      \"output\":{\"shape\":\"CreateVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates a custom vocabulary associated with your Amazon Connect instance. You can set a custom vocabulary to be your default vocabulary for a given language. Contact Lens for Amazon Connect uses the default vocabulary in post-call and real-time contact analysis sessions for that language.</p>\"\
    },\
    \"DeactivateEvaluationForm\":{\
      \"name\":\"DeactivateEvaluationForm\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/evaluation-forms/{InstanceId}/{EvaluationFormId}/deactivate\"\
      },\
      \"input\":{\"shape\":\"DeactivateEvaluationFormRequest\"},\
      \"output\":{\"shape\":\"DeactivateEvaluationFormResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Deactivates an evaluation form in the specified Amazon Connect instance. After a form is deactivated, it is no longer available for users to start new evaluations based on the form. </p>\"\
    },\
    \"DeleteContactEvaluation\":{\
      \"name\":\"DeleteContactEvaluation\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/contact-evaluations/{InstanceId}/{EvaluationId}\"\
      },\
      \"input\":{\"shape\":\"DeleteContactEvaluationRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Deletes a contact evaluation in the specified Amazon Connect instance.</p>\",\
      \"idempotent\":true\
    },\
    \"DeleteContactFlow\":{\
      \"name\":\"DeleteContactFlow\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/contact-flows/{InstanceId}/{ContactFlowId}\"\
      },\
      \"input\":{\"shape\":\"DeleteContactFlowRequest\"},\
      \"output\":{\"shape\":\"DeleteContactFlowResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes a flow for the specified Amazon Connect instance.</p>\"\
    },\
    \"DeleteContactFlowModule\":{\
      \"name\":\"DeleteContactFlowModule\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}\"\
      },\
      \"input\":{\"shape\":\"DeleteContactFlowModuleRequest\"},\
      \"output\":{\"shape\":\"DeleteContactFlowModuleResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified flow module.</p>\"\
    },\
    \"DeleteEvaluationForm\":{\
      \"name\":\"DeleteEvaluationForm\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/evaluation-forms/{InstanceId}/{EvaluationFormId}\"\
      },\
      \"input\":{\"shape\":\"DeleteEvaluationFormRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Deletes an evaluation form in the specified Amazon Connect instance. </p> <ul> <li> <p>If the version property is provided, only the specified version of the evaluation form is deleted.</p> </li> <li> <p>If no version is provided, then the full form (all versions) is deleted.</p> </li> </ul>\",\
      \"idempotent\":true\
    },\
    \"DeleteHoursOfOperation\":{\
      \"name\":\"DeleteHoursOfOperation\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/hours-of-operations/{InstanceId}/{HoursOfOperationId}\"\
      },\
      \"input\":{\"shape\":\"DeleteHoursOfOperationRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Deletes an hours of operation.</p>\"\
    },\
    \"DeleteInstance\":{\
      \"name\":\"DeleteInstance\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/instance/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"DeleteInstanceRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Deletes the Amazon Connect instance.</p> <p>Amazon Connect enforces a limit on the total number of instances that you can create or delete in 30 days. If you exceed this limit, you will get an error message indicating there has been an excessive number of attempts at creating or deleting instances. You must wait 30 days before you can restart creating and deleting instances in your account.</p>\"\
    },\
    \"DeleteIntegrationAssociation\":{\
      \"name\":\"DeleteIntegrationAssociation\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/instance/{InstanceId}/integration-associations/{IntegrationAssociationId}\"\
      },\
      \"input\":{\"shape\":\"DeleteIntegrationAssociationRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes an Amazon Web Services resource association from an Amazon Connect instance. The association must not have any use cases associated with it.</p>\"\
    },\
    \"DeletePrompt\":{\
      \"name\":\"DeletePrompt\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/prompts/{InstanceId}/{PromptId}\"\
      },\
      \"input\":{\"shape\":\"DeletePromptRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Deletes a prompt.</p>\"\
    },\
    \"DeleteQueue\":{\
      \"name\":\"DeleteQueue\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}\"\
      },\
      \"input\":{\"shape\":\"DeleteQueueRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Deletes a queue.</p>\"\
    },\
    \"DeleteQuickConnect\":{\
      \"name\":\"DeleteQuickConnect\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/quick-connects/{InstanceId}/{QuickConnectId}\"\
      },\
      \"input\":{\"shape\":\"DeleteQuickConnectRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Deletes a quick connect.</p>\"\
    },\
    \"DeleteRoutingProfile\":{\
      \"name\":\"DeleteRoutingProfile\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}/{RoutingProfileId}\"\
      },\
      \"input\":{\"shape\":\"DeleteRoutingProfileRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Deletes a routing profile.</p>\"\
    },\
    \"DeleteRule\":{\
      \"name\":\"DeleteRule\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/rules/{InstanceId}/{RuleId}\"\
      },\
      \"input\":{\"shape\":\"DeleteRuleRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Deletes a rule for the specified Amazon Connect instance.</p>\"\
    },\
    \"DeleteSecurityProfile\":{\
      \"name\":\"DeleteSecurityProfile\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/security-profiles/{InstanceId}/{SecurityProfileId}\"\
      },\
      \"input\":{\"shape\":\"DeleteSecurityProfileRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceInUseException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Deletes a security profile.</p>\"\
    },\
    \"DeleteTaskTemplate\":{\
      \"name\":\"DeleteTaskTemplate\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/instance/{InstanceId}/task/template/{TaskTemplateId}\"\
      },\
      \"input\":{\"shape\":\"DeleteTaskTemplateRequest\"},\
      \"output\":{\"shape\":\"DeleteTaskTemplateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Deletes the task template.</p>\"\
    },\
    \"DeleteTrafficDistributionGroup\":{\
      \"name\":\"DeleteTrafficDistributionGroup\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/traffic-distribution-group/{TrafficDistributionGroupId}\"\
      },\
      \"input\":{\"shape\":\"DeleteTrafficDistributionGroupRequest\"},\
      \"output\":{\"shape\":\"DeleteTrafficDistributionGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Deletes a traffic distribution group. This API can be called only in the Region where the traffic distribution group is created.</p> <p>For more information about deleting traffic distribution groups, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/delete-traffic-distribution-groups.html\\\">Delete traffic distribution groups</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"DeleteUseCase\":{\
      \"name\":\"DeleteUseCase\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/instance/{InstanceId}/integration-associations/{IntegrationAssociationId}/use-cases/{UseCaseId}\"\
      },\
      \"input\":{\"shape\":\"DeleteUseCaseRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes a use case from an integration association.</p>\"\
    },\
    \"DeleteUser\":{\
      \"name\":\"DeleteUser\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/users/{InstanceId}/{UserId}\"\
      },\
      \"input\":{\"shape\":\"DeleteUserRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Deletes a user account from the specified Amazon Connect instance.</p> <p>For information about what happens to a user's data when their account is deleted, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/delete-users.html\\\">Delete Users from Your Amazon Connect Instance</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"DeleteUserHierarchyGroup\":{\
      \"name\":\"DeleteUserHierarchyGroup\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/user-hierarchy-groups/{InstanceId}/{HierarchyGroupId}\"\
      },\
      \"input\":{\"shape\":\"DeleteUserHierarchyGroupRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Deletes an existing user hierarchy group. It must not be associated with any agents or have any active child groups.</p>\"\
    },\
    \"DeleteVocabulary\":{\
      \"name\":\"DeleteVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/vocabulary-remove/{InstanceId}/{VocabularyId}\"\
      },\
      \"input\":{\"shape\":\"DeleteVocabularyRequest\"},\
      \"output\":{\"shape\":\"DeleteVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceInUseException\"}\
      ],\
      \"documentation\":\"<p>Deletes the vocabulary that has the given identifier.</p>\"\
    },\
    \"DescribeAgentStatus\":{\
      \"name\":\"DescribeAgentStatus\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/agent-status/{InstanceId}/{AgentStatusId}\"\
      },\
      \"input\":{\"shape\":\"DescribeAgentStatusRequest\"},\
      \"output\":{\"shape\":\"DescribeAgentStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Describes an agent status.</p>\"\
    },\
    \"DescribeContact\":{\
      \"name\":\"DescribeContact\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/contacts/{InstanceId}/{ContactId}\"\
      },\
      \"input\":{\"shape\":\"DescribeContactRequest\"},\
      \"output\":{\"shape\":\"DescribeContactResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Describes the specified contact. </p> <important> <p>Contact information remains available in Amazon Connect for 24 months, and then it is deleted.</p> <p>Only data from November 12, 2021, and later is returned by this API.</p> </important>\"\
    },\
    \"DescribeContactEvaluation\":{\
      \"name\":\"DescribeContactEvaluation\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/contact-evaluations/{InstanceId}/{EvaluationId}\"\
      },\
      \"input\":{\"shape\":\"DescribeContactEvaluationRequest\"},\
      \"output\":{\"shape\":\"DescribeContactEvaluationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes a contact evaluation in the specified Amazon Connect instance.</p>\"\
    },\
    \"DescribeContactFlow\":{\
      \"name\":\"DescribeContactFlow\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/contact-flows/{InstanceId}/{ContactFlowId}\"\
      },\
      \"input\":{\"shape\":\"DescribeContactFlowRequest\"},\
      \"output\":{\"shape\":\"DescribeContactFlowResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ContactFlowNotPublishedException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified flow.</p> <p>You can also create and update flows using the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/flow-language.html\\\">Amazon Connect Flow language</a>.</p>\"\
    },\
    \"DescribeContactFlowModule\":{\
      \"name\":\"DescribeContactFlowModule\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}\"\
      },\
      \"input\":{\"shape\":\"DescribeContactFlowModuleRequest\"},\
      \"output\":{\"shape\":\"DescribeContactFlowModuleResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified flow module.</p>\"\
    },\
    \"DescribeEvaluationForm\":{\
      \"name\":\"DescribeEvaluationForm\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/evaluation-forms/{InstanceId}/{EvaluationFormId}\"\
      },\
      \"input\":{\"shape\":\"DescribeEvaluationFormRequest\"},\
      \"output\":{\"shape\":\"DescribeEvaluationFormResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes an evaluation form in the specified Amazon Connect instance. If the version property is not provided, the latest version of the evaluation form is described.</p>\"\
    },\
    \"DescribeHoursOfOperation\":{\
      \"name\":\"DescribeHoursOfOperation\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/hours-of-operations/{InstanceId}/{HoursOfOperationId}\"\
      },\
      \"input\":{\"shape\":\"DescribeHoursOfOperationRequest\"},\
      \"output\":{\"shape\":\"DescribeHoursOfOperationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Describes the hours of operation.</p>\"\
    },\
    \"DescribeInstance\":{\
      \"name\":\"DescribeInstance\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"DescribeInstanceRequest\"},\
      \"output\":{\"shape\":\"DescribeInstanceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Returns the current state of the specified instance identifier. It tracks the instance while it is being created and returns an error status, if applicable. </p> <p>If an instance is not created successfully, the instance status reason field returns details relevant to the reason. The instance in a failed state is returned only for 24 hours after the CreateInstance API was invoked.</p>\"\
    },\
    \"DescribeInstanceAttribute\":{\
      \"name\":\"DescribeInstanceAttribute\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/attribute/{AttributeType}\"\
      },\
      \"input\":{\"shape\":\"DescribeInstanceAttributeRequest\"},\
      \"output\":{\"shape\":\"DescribeInstanceAttributeResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Describes the specified instance attribute.</p>\"\
    },\
    \"DescribeInstanceStorageConfig\":{\
      \"name\":\"DescribeInstanceStorageConfig\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/storage-config/{AssociationId}\"\
      },\
      \"input\":{\"shape\":\"DescribeInstanceStorageConfigRequest\"},\
      \"output\":{\"shape\":\"DescribeInstanceStorageConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Retrieves the current storage configurations for the specified resource type, association ID, and instance ID.</p>\"\
    },\
    \"DescribePhoneNumber\":{\
      \"name\":\"DescribePhoneNumber\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/phone-number/{PhoneNumberId}\"\
      },\
      \"input\":{\"shape\":\"DescribePhoneNumberRequest\"},\
      \"output\":{\"shape\":\"DescribePhoneNumberResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Gets details and status of a phone number thatâs claimed to your Amazon Connect instance or traffic distribution group.</p> <important> <p>If the number is claimed to a traffic distribution group, and you are calling in the Amazon Web Services Region where the traffic distribution group was created, you can use either a phone number ARN or UUID value for the <code>PhoneNumberId</code> URI request parameter. However, if the number is claimed to a traffic distribution group and you are calling this API in the alternate Amazon Web Services Region associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p> </important>\"\
    },\
    \"DescribePrompt\":{\
      \"name\":\"DescribePrompt\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/prompts/{InstanceId}/{PromptId}\"\
      },\
      \"input\":{\"shape\":\"DescribePromptRequest\"},\
      \"output\":{\"shape\":\"DescribePromptResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes the prompt.</p>\"\
    },\
    \"DescribeQueue\":{\
      \"name\":\"DescribeQueue\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}\"\
      },\
      \"input\":{\"shape\":\"DescribeQueueRequest\"},\
      \"output\":{\"shape\":\"DescribeQueueResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Describes the specified queue.</p>\"\
    },\
    \"DescribeQuickConnect\":{\
      \"name\":\"DescribeQuickConnect\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/quick-connects/{InstanceId}/{QuickConnectId}\"\
      },\
      \"input\":{\"shape\":\"DescribeQuickConnectRequest\"},\
      \"output\":{\"shape\":\"DescribeQuickConnectResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes the quick connect.</p>\"\
    },\
    \"DescribeRoutingProfile\":{\
      \"name\":\"DescribeRoutingProfile\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}/{RoutingProfileId}\"\
      },\
      \"input\":{\"shape\":\"DescribeRoutingProfileRequest\"},\
      \"output\":{\"shape\":\"DescribeRoutingProfileResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified routing profile.</p>\"\
    },\
    \"DescribeRule\":{\
      \"name\":\"DescribeRule\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/rules/{InstanceId}/{RuleId}\"\
      },\
      \"input\":{\"shape\":\"DescribeRuleRequest\"},\
      \"output\":{\"shape\":\"DescribeRuleResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Describes a rule for the specified Amazon Connect instance.</p>\"\
    },\
    \"DescribeSecurityProfile\":{\
      \"name\":\"DescribeSecurityProfile\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/security-profiles/{InstanceId}/{SecurityProfileId}\"\
      },\
      \"input\":{\"shape\":\"DescribeSecurityProfileRequest\"},\
      \"output\":{\"shape\":\"DescribeSecurityProfileResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Gets basic information about the security profle.</p>\"\
    },\
    \"DescribeTrafficDistributionGroup\":{\
      \"name\":\"DescribeTrafficDistributionGroup\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/traffic-distribution-group/{TrafficDistributionGroupId}\"\
      },\
      \"input\":{\"shape\":\"DescribeTrafficDistributionGroupRequest\"},\
      \"output\":{\"shape\":\"DescribeTrafficDistributionGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets details and status of a traffic distribution group.</p>\"\
    },\
    \"DescribeUser\":{\
      \"name\":\"DescribeUser\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/users/{InstanceId}/{UserId}\"\
      },\
      \"input\":{\"shape\":\"DescribeUserRequest\"},\
      \"output\":{\"shape\":\"DescribeUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified user account. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID in the Amazon Connect console</a> (itâs the final part of the ARN). The console does not display the user IDs. Instead, list the users and note the IDs provided in the output.</p>\"\
    },\
    \"DescribeUserHierarchyGroup\":{\
      \"name\":\"DescribeUserHierarchyGroup\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/user-hierarchy-groups/{InstanceId}/{HierarchyGroupId}\"\
      },\
      \"input\":{\"shape\":\"DescribeUserHierarchyGroupRequest\"},\
      \"output\":{\"shape\":\"DescribeUserHierarchyGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified hierarchy group.</p>\"\
    },\
    \"DescribeUserHierarchyStructure\":{\
      \"name\":\"DescribeUserHierarchyStructure\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/user-hierarchy-structure/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"DescribeUserHierarchyStructureRequest\"},\
      \"output\":{\"shape\":\"DescribeUserHierarchyStructureResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes the hierarchy structure of the specified Amazon Connect instance.</p>\"\
    },\
    \"DescribeVocabulary\":{\
      \"name\":\"DescribeVocabulary\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/vocabulary/{InstanceId}/{VocabularyId}\"\
      },\
      \"input\":{\"shape\":\"DescribeVocabularyRequest\"},\
      \"output\":{\"shape\":\"DescribeVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified vocabulary.</p>\"\
    },\
    \"DisassociateApprovedOrigin\":{\
      \"name\":\"DisassociateApprovedOrigin\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/instance/{InstanceId}/approved-origin\"\
      },\
      \"input\":{\"shape\":\"DisassociateApprovedOriginRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Revokes access to integrated applications from Amazon Connect.</p>\"\
    },\
    \"DisassociateBot\":{\
      \"name\":\"DisassociateBot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/instance/{InstanceId}/bot\"\
      },\
      \"input\":{\"shape\":\"DisassociateBotRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Revokes authorization from the specified instance to access the specified Amazon Lex or Amazon Lex V2 bot. </p>\"\
    },\
    \"DisassociateInstanceStorageConfig\":{\
      \"name\":\"DisassociateInstanceStorageConfig\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/instance/{InstanceId}/storage-config/{AssociationId}\"\
      },\
      \"input\":{\"shape\":\"DisassociateInstanceStorageConfigRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Removes the storage type configurations for the specified resource type and association ID.</p>\"\
    },\
    \"DisassociateLambdaFunction\":{\
      \"name\":\"DisassociateLambdaFunction\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/instance/{InstanceId}/lambda-function\"\
      },\
      \"input\":{\"shape\":\"DisassociateLambdaFunctionRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Remove the Lambda function from the dropdown options available in the relevant flow blocks.</p>\"\
    },\
    \"DisassociateLexBot\":{\
      \"name\":\"DisassociateLexBot\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/instance/{InstanceId}/lex-bot\"\
      },\
      \"input\":{\"shape\":\"DisassociateLexBotRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Revokes authorization from the specified instance to access the specified Amazon Lex bot.</p>\"\
    },\
    \"DisassociatePhoneNumberContactFlow\":{\
      \"name\":\"DisassociatePhoneNumberContactFlow\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/phone-number/{PhoneNumberId}/contact-flow\"\
      },\
      \"input\":{\"shape\":\"DisassociatePhoneNumberContactFlowRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Removes the flow association from a phone number claimed to your Amazon Connect instance.</p> <important> <p>If the number is claimed to a traffic distribution group, and you are calling this API using an instance in the Amazon Web Services Region where the traffic distribution group was created, you can use either a full phone number ARN or UUID value for the <code>PhoneNumberId</code> URI request parameter. However, if the number is claimed to a traffic distribution group and you are calling this API using an instance in the alternate Amazon Web Services Region associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p> </important>\"\
    },\
    \"DisassociateQueueQuickConnects\":{\
      \"name\":\"DisassociateQueueQuickConnects\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}/disassociate-quick-connects\"\
      },\
      \"input\":{\"shape\":\"DisassociateQueueQuickConnectsRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Disassociates a set of quick connects from a queue.</p>\"\
    },\
    \"DisassociateRoutingProfileQueues\":{\
      \"name\":\"DisassociateRoutingProfileQueues\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}/{RoutingProfileId}/disassociate-queues\"\
      },\
      \"input\":{\"shape\":\"DisassociateRoutingProfileQueuesRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Disassociates a set of queues from a routing profile.</p>\"\
    },\
    \"DisassociateSecurityKey\":{\
      \"name\":\"DisassociateSecurityKey\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/instance/{InstanceId}/security-key/{AssociationId}\"\
      },\
      \"input\":{\"shape\":\"DisassociateSecurityKeyRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Deletes the specified security key.</p>\"\
    },\
    \"DisassociateTrafficDistributionGroupUser\":{\
      \"name\":\"DisassociateTrafficDistributionGroupUser\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/traffic-distribution-group/{TrafficDistributionGroupId}/user\"\
      },\
      \"input\":{\"shape\":\"DisassociateTrafficDistributionGroupUserRequest\"},\
      \"output\":{\"shape\":\"DisassociateTrafficDistributionGroupUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Disassociates an agent from a traffic distribution group.</p>\",\
      \"idempotent\":true\
    },\
    \"DismissUserContact\":{\
      \"name\":\"DismissUserContact\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/users/{InstanceId}/{UserId}/contact\"\
      },\
      \"input\":{\"shape\":\"DismissUserContactRequest\"},\
      \"output\":{\"shape\":\"DismissUserContactResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Dismisses contacts from an agentâs CCP and returns the agent to an available state, which allows the agent to receive a new routed contact. Contacts can only be dismissed if they are in a <code>MISSED</code>, <code>ERROR</code>, <code>ENDED</code>, or <code>REJECTED</code> state in the <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/about-contact-states.html\\\">Agent Event Stream</a>.</p>\"\
    },\
    \"GetContactAttributes\":{\
      \"name\":\"GetContactAttributes\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/contact/attributes/{InstanceId}/{InitialContactId}\"\
      },\
      \"input\":{\"shape\":\"GetContactAttributesRequest\"},\
      \"output\":{\"shape\":\"GetContactAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the contact attributes for the specified contact.</p>\"\
    },\
    \"GetCurrentMetricData\":{\
      \"name\":\"GetCurrentMetricData\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/metrics/current/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"GetCurrentMetricDataRequest\"},\
      \"output\":{\"shape\":\"GetCurrentMetricDataResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Gets the real-time metric data from the specified Amazon Connect instance.</p> <p>For a description of each metric, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html\\\">Real-time Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"GetCurrentUserData\":{\
      \"name\":\"GetCurrentUserData\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/metrics/userdata/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"GetCurrentUserDataRequest\"},\
      \"output\":{\"shape\":\"GetCurrentUserDataResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Gets the real-time active user data from the specified Amazon Connect instance. </p>\"\
    },\
    \"GetFederationToken\":{\
      \"name\":\"GetFederationToken\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/user/federate/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"GetFederationTokenRequest\"},\
      \"output\":{\"shape\":\"GetFederationTokenResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"DuplicateResourceException\"}\
      ],\
      \"documentation\":\"<p>Retrieves a token for federation.</p> <note> <p>This API doesn't support root users. If you try to invoke GetFederationToken with root credentials, an error message similar to the following one appears: </p> <p> <code>Provided identity: Principal: .... User: .... cannot be used for federation with Amazon Connect</code> </p> </note>\"\
    },\
    \"GetMetricData\":{\
      \"name\":\"GetMetricData\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/metrics/historical/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"GetMetricDataRequest\"},\
      \"output\":{\"shape\":\"GetMetricDataResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Gets historical metric data from the specified Amazon Connect instance.</p> <p>For a description of each historical metric, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html\\\">Historical Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"GetMetricDataV2\":{\
      \"name\":\"GetMetricDataV2\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/metrics/data\"\
      },\
      \"input\":{\"shape\":\"GetMetricDataV2Request\"},\
      \"output\":{\"shape\":\"GetMetricDataV2Response\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Gets metric data from the specified Amazon Connect instance. </p> <p> <code>GetMetricDataV2</code> offers more features than <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_GetMetricData.html\\\">GetMetricData</a>, the previous version of this API. It has new metrics, offers filtering at a metric level, and offers the ability to filter and group data by channels, queues, routing profiles, agents, and agent hierarchy levels. It can retrieve historical data for the last 35 days, in 24-hour intervals.</p> <p>For a description of the historical metrics that are supported by <code>GetMetricDataV2</code> and <code>GetMetricData</code>, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html\\\">Historical metrics definitions</a> in the <i>Amazon Connect Administrator's Guide</i>.</p>\"\
    },\
    \"GetPromptFile\":{\
      \"name\":\"GetPromptFile\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/prompts/{InstanceId}/{PromptId}/file\"\
      },\
      \"input\":{\"shape\":\"GetPromptFileRequest\"},\
      \"output\":{\"shape\":\"GetPromptFileResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Gets the prompt file.</p>\"\
    },\
    \"GetTaskTemplate\":{\
      \"name\":\"GetTaskTemplate\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/task/template/{TaskTemplateId}\"\
      },\
      \"input\":{\"shape\":\"GetTaskTemplateRequest\"},\
      \"output\":{\"shape\":\"GetTaskTemplateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Gets details about a specific task template in the specified Amazon Connect instance.</p>\"\
    },\
    \"GetTrafficDistribution\":{\
      \"name\":\"GetTrafficDistribution\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/traffic-distribution/{Id}\"\
      },\
      \"input\":{\"shape\":\"GetTrafficDistributionRequest\"},\
      \"output\":{\"shape\":\"GetTrafficDistributionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the current traffic distribution for a given traffic distribution group.</p>\"\
    },\
    \"ListAgentStatuses\":{\
      \"name\":\"ListAgentStatuses\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/agent-status/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListAgentStatusRequest\"},\
      \"output\":{\"shape\":\"ListAgentStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Lists agent statuses.</p>\"\
    },\
    \"ListApprovedOrigins\":{\
      \"name\":\"ListApprovedOrigins\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/approved-origins\"\
      },\
      \"input\":{\"shape\":\"ListApprovedOriginsRequest\"},\
      \"output\":{\"shape\":\"ListApprovedOriginsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Returns a paginated list of all approved origins associated with the instance.</p>\"\
    },\
    \"ListBots\":{\
      \"name\":\"ListBots\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/bots\"\
      },\
      \"input\":{\"shape\":\"ListBotsRequest\"},\
      \"output\":{\"shape\":\"ListBotsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>For the specified version of Amazon Lex, returns a paginated list of all the Amazon Lex bots currently associated with the instance. Use this API to returns both Amazon Lex V1 and V2 bots.</p>\"\
    },\
    \"ListContactEvaluations\":{\
      \"name\":\"ListContactEvaluations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/contact-evaluations/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListContactEvaluationsRequest\"},\
      \"output\":{\"shape\":\"ListContactEvaluationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Lists contact evaluations in the specified Amazon Connect instance.</p>\"\
    },\
    \"ListContactFlowModules\":{\
      \"name\":\"ListContactFlowModules\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/contact-flow-modules-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListContactFlowModulesRequest\"},\
      \"output\":{\"shape\":\"ListContactFlowModulesResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the flow modules for the specified Amazon Connect instance.</p>\"\
    },\
    \"ListContactFlows\":{\
      \"name\":\"ListContactFlows\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/contact-flows-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListContactFlowsRequest\"},\
      \"output\":{\"shape\":\"ListContactFlowsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the flows for the specified Amazon Connect instance.</p> <p>You can also create and update flows using the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/flow-language.html\\\">Amazon Connect Flow language</a>.</p> <p>For more information about flows, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/concepts-contact-flows.html\\\">Flows</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ListContactReferences\":{\
      \"name\":\"ListContactReferences\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/contact/references/{InstanceId}/{ContactId}\"\
      },\
      \"input\":{\"shape\":\"ListContactReferencesRequest\"},\
      \"output\":{\"shape\":\"ListContactReferencesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>For the specified <code>referenceTypes</code>, returns a list of references associated with the contact. </p>\"\
    },\
    \"ListDefaultVocabularies\":{\
      \"name\":\"ListDefaultVocabularies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/default-vocabulary-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListDefaultVocabulariesRequest\"},\
      \"output\":{\"shape\":\"ListDefaultVocabulariesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Lists the default vocabularies for the specified Amazon Connect instance.</p>\"\
    },\
    \"ListEvaluationFormVersions\":{\
      \"name\":\"ListEvaluationFormVersions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/evaluation-forms/{InstanceId}/{EvaluationFormId}/versions\"\
      },\
      \"input\":{\"shape\":\"ListEvaluationFormVersionsRequest\"},\
      \"output\":{\"shape\":\"ListEvaluationFormVersionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Lists versions of an evaluation form in the specified Amazon Connect instance.</p>\"\
    },\
    \"ListEvaluationForms\":{\
      \"name\":\"ListEvaluationForms\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/evaluation-forms/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListEvaluationFormsRequest\"},\
      \"output\":{\"shape\":\"ListEvaluationFormsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Lists evaluation forms in the specified Amazon Connect instance.</p>\"\
    },\
    \"ListHoursOfOperations\":{\
      \"name\":\"ListHoursOfOperations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/hours-of-operations-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListHoursOfOperationsRequest\"},\
      \"output\":{\"shape\":\"ListHoursOfOperationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the hours of operation for the specified Amazon Connect instance.</p> <p>For more information about hours of operation, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/set-hours-operation.html\\\">Set the Hours of Operation for a Queue</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ListInstanceAttributes\":{\
      \"name\":\"ListInstanceAttributes\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/attributes\"\
      },\
      \"input\":{\"shape\":\"ListInstanceAttributesRequest\"},\
      \"output\":{\"shape\":\"ListInstanceAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Returns a paginated list of all attribute types for the given instance.</p>\"\
    },\
    \"ListInstanceStorageConfigs\":{\
      \"name\":\"ListInstanceStorageConfigs\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/storage-configs\"\
      },\
      \"input\":{\"shape\":\"ListInstanceStorageConfigsRequest\"},\
      \"output\":{\"shape\":\"ListInstanceStorageConfigsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Returns a paginated list of storage configs for the identified instance and resource type.</p>\"\
    },\
    \"ListInstances\":{\
      \"name\":\"ListInstances\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance\"\
      },\
      \"input\":{\"shape\":\"ListInstancesRequest\"},\
      \"output\":{\"shape\":\"ListInstancesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Return a list of instances which are in active state, creation-in-progress state, and failed state. Instances that aren't successfully created (they are in a failed state) are returned only for 24 hours after the CreateInstance API was invoked.</p>\"\
    },\
    \"ListIntegrationAssociations\":{\
      \"name\":\"ListIntegrationAssociations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/integration-associations\"\
      },\
      \"input\":{\"shape\":\"ListIntegrationAssociationsRequest\"},\
      \"output\":{\"shape\":\"ListIntegrationAssociationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Provides summary information about the Amazon Web Services resource associations for the specified Amazon Connect instance.</p>\"\
    },\
    \"ListLambdaFunctions\":{\
      \"name\":\"ListLambdaFunctions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/lambda-functions\"\
      },\
      \"input\":{\"shape\":\"ListLambdaFunctionsRequest\"},\
      \"output\":{\"shape\":\"ListLambdaFunctionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Returns a paginated list of all Lambda functions that display in the dropdown options in the relevant flow blocks.</p>\"\
    },\
    \"ListLexBots\":{\
      \"name\":\"ListLexBots\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/lex-bots\"\
      },\
      \"input\":{\"shape\":\"ListLexBotsRequest\"},\
      \"output\":{\"shape\":\"ListLexBotsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Returns a paginated list of all the Amazon Lex V1 bots currently associated with the instance. To return both Amazon Lex V1 and V2 bots, use the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_ListBots.html\\\">ListBots</a> API. </p>\"\
    },\
    \"ListPhoneNumbers\":{\
      \"name\":\"ListPhoneNumbers\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/phone-numbers-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListPhoneNumbersRequest\"},\
      \"output\":{\"shape\":\"ListPhoneNumbersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the phone numbers for the specified Amazon Connect instance. </p> <p>For more information about phone numbers, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/contact-center-phone-number.html\\\">Set Up Phone Numbers for Your Contact Center</a> in the <i>Amazon Connect Administrator Guide</i>.</p> <important> <p>The phone number <code>Arn</code> value that is returned from each of the items in the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_ListPhoneNumbers.html#connect-ListPhoneNumbers-response-PhoneNumberSummaryList\\\">PhoneNumberSummaryList</a> cannot be used to tag phone number resources. It will fail with a <code>ResourceNotFoundException</code>. Instead, use the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_ListPhoneNumbersV2.html\\\">ListPhoneNumbersV2</a> API. It returns the new phone number ARN that can be used to tag phone number resources.</p> </important>\"\
    },\
    \"ListPhoneNumbersV2\":{\
      \"name\":\"ListPhoneNumbersV2\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/phone-number/list\"\
      },\
      \"input\":{\"shape\":\"ListPhoneNumbersV2Request\"},\
      \"output\":{\"shape\":\"ListPhoneNumbersV2Response\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Lists phone numbers claimed to your Amazon Connect instance or traffic distribution group. If the provided <code>TargetArn</code> is a traffic distribution group, you can call this API in both Amazon Web Services Regions associated with traffic distribution group.</p> <p>For more information about phone numbers, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/contact-center-phone-number.html\\\">Set Up Phone Numbers for Your Contact Center</a> in the <i>Amazon Connect Administrator Guide</i>.</p> <note> <ul> <li> <p>When given an instance ARN, <code>ListPhoneNumbersV2</code> returns only the phone numbers claimed to the instance.</p> </li> <li> <p>When given a traffic distribution group ARN <code>ListPhoneNumbersV2</code> returns only the phone numbers claimed to the traffic distribution group.</p> </li> </ul> </note>\"\
    },\
    \"ListPrompts\":{\
      \"name\":\"ListPrompts\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/prompts-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListPromptsRequest\"},\
      \"output\":{\"shape\":\"ListPromptsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the prompts for the specified Amazon Connect instance.</p>\"\
    },\
    \"ListQueueQuickConnects\":{\
      \"name\":\"ListQueueQuickConnects\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}/quick-connects\"\
      },\
      \"input\":{\"shape\":\"ListQueueQuickConnectsRequest\"},\
      \"output\":{\"shape\":\"ListQueueQuickConnectsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Lists the quick connects associated with a queue.</p>\"\
    },\
    \"ListQueues\":{\
      \"name\":\"ListQueues\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/queues-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListQueuesRequest\"},\
      \"output\":{\"shape\":\"ListQueuesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the queues for the specified Amazon Connect instance.</p> <p>If you do not specify a <code>QueueTypes</code> parameter, both standard and agent queues are returned. This might cause an unexpected truncation of results if you have more than 1000 agents and you limit the number of results of the API call in code.</p> <p>For more information about queues, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/concepts-queues-standard-and-agent.html\\\">Queues: Standard and Agent</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ListQuickConnects\":{\
      \"name\":\"ListQuickConnects\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/quick-connects/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListQuickConnectsRequest\"},\
      \"output\":{\"shape\":\"ListQuickConnectsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the quick connects for the specified Amazon Connect instance. </p>\"\
    },\
    \"ListRoutingProfileQueues\":{\
      \"name\":\"ListRoutingProfileQueues\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}/{RoutingProfileId}/queues\"\
      },\
      \"input\":{\"shape\":\"ListRoutingProfileQueuesRequest\"},\
      \"output\":{\"shape\":\"ListRoutingProfileQueuesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Lists the queues associated with a routing profile.</p>\"\
    },\
    \"ListRoutingProfiles\":{\
      \"name\":\"ListRoutingProfiles\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/routing-profiles-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListRoutingProfilesRequest\"},\
      \"output\":{\"shape\":\"ListRoutingProfilesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides summary information about the routing profiles for the specified Amazon Connect instance.</p> <p>For more information about routing profiles, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing.html\\\">Routing Profiles</a> and <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/routing-profiles.html\\\">Create a Routing Profile</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ListRules\":{\
      \"name\":\"ListRules\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/rules/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListRulesRequest\"},\
      \"output\":{\"shape\":\"ListRulesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>List all rules for the specified Amazon Connect instance.</p>\"\
    },\
    \"ListSecurityKeys\":{\
      \"name\":\"ListSecurityKeys\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/security-keys\"\
      },\
      \"input\":{\"shape\":\"ListSecurityKeysRequest\"},\
      \"output\":{\"shape\":\"ListSecurityKeysResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Returns a paginated list of all security keys associated with the instance.</p>\"\
    },\
    \"ListSecurityProfilePermissions\":{\
      \"name\":\"ListSecurityProfilePermissions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/security-profiles-permissions/{InstanceId}/{SecurityProfileId}\"\
      },\
      \"input\":{\"shape\":\"ListSecurityProfilePermissionsRequest\"},\
      \"output\":{\"shape\":\"ListSecurityProfilePermissionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Lists the permissions granted to a security profile.</p>\"\
    },\
    \"ListSecurityProfiles\":{\
      \"name\":\"ListSecurityProfiles\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/security-profiles-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListSecurityProfilesRequest\"},\
      \"output\":{\"shape\":\"ListSecurityProfilesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides summary information about the security profiles for the specified Amazon Connect instance.</p> <p>For more information about security profiles, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/connect-security-profiles.html\\\">Security Profiles</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/tags/{resourceArn}\"\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ListTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists the tags for the specified resource.</p> <p>For sample policies that use tags, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/security_iam_id-based-policy-examples.html\\\">Amazon Connect Identity-Based Policy Examples</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ListTaskTemplates\":{\
      \"name\":\"ListTaskTemplates\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/task/template\"\
      },\
      \"input\":{\"shape\":\"ListTaskTemplatesRequest\"},\
      \"output\":{\"shape\":\"ListTaskTemplatesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Lists task templates for the specified Amazon Connect instance.</p>\"\
    },\
    \"ListTrafficDistributionGroupUsers\":{\
      \"name\":\"ListTrafficDistributionGroupUsers\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/traffic-distribution-group/{TrafficDistributionGroupId}/user\"\
      },\
      \"input\":{\"shape\":\"ListTrafficDistributionGroupUsersRequest\"},\
      \"output\":{\"shape\":\"ListTrafficDistributionGroupUsersResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Lists traffic distribution group users.</p>\"\
    },\
    \"ListTrafficDistributionGroups\":{\
      \"name\":\"ListTrafficDistributionGroups\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/traffic-distribution-groups\"\
      },\
      \"input\":{\"shape\":\"ListTrafficDistributionGroupsRequest\"},\
      \"output\":{\"shape\":\"ListTrafficDistributionGroupsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Lists traffic distribution groups.</p>\"\
    },\
    \"ListUseCases\":{\
      \"name\":\"ListUseCases\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/integration-associations/{IntegrationAssociationId}/use-cases\"\
      },\
      \"input\":{\"shape\":\"ListUseCasesRequest\"},\
      \"output\":{\"shape\":\"ListUseCasesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists the use cases for the integration association. </p>\"\
    },\
    \"ListUserHierarchyGroups\":{\
      \"name\":\"ListUserHierarchyGroups\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/user-hierarchy-groups-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListUserHierarchyGroupsRequest\"},\
      \"output\":{\"shape\":\"ListUserHierarchyGroupsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides summary information about the hierarchy groups for the specified Amazon Connect instance.</p> <p>For more information about agent hierarchies, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/agent-hierarchy.html\\\">Set Up Agent Hierarchies</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ListUsers\":{\
      \"name\":\"ListUsers\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/users-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListUsersRequest\"},\
      \"output\":{\"shape\":\"ListUsersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides summary information about the users for the specified Amazon Connect instance.</p>\"\
    },\
    \"MonitorContact\":{\
      \"name\":\"MonitorContact\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/monitor\"\
      },\
      \"input\":{\"shape\":\"MonitorContactRequest\"},\
      \"output\":{\"shape\":\"MonitorContactResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"IdempotencyException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Initiates silent monitoring of a contact. The Contact Control Panel (CCP) of the user specified by <i>userId</i> will be set to silent monitoring mode on the contact.</p>\"\
    },\
    \"PutUserStatus\":{\
      \"name\":\"PutUserStatus\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/users/{InstanceId}/{UserId}/status\"\
      },\
      \"input\":{\"shape\":\"PutUserStatusRequest\"},\
      \"output\":{\"shape\":\"PutUserStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Changes the current status of a user or agent in Amazon Connect. If the agent is currently handling a contact, this sets the agent's next status.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/metrics-agent-status.html\\\">Agent status</a> and <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/set-next-status.html\\\">Set your next status</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ReleasePhoneNumber\":{\
      \"name\":\"ReleasePhoneNumber\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/phone-number/{PhoneNumberId}\"\
      },\
      \"input\":{\"shape\":\"ReleasePhoneNumberRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"IdempotencyException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Releases a phone number previously claimed to an Amazon Connect instance or traffic distribution group. You can call this API only in the Amazon Web Services Region where the number was claimed.</p> <important> <p>To release phone numbers from a traffic distribution group, use the <code>ReleasePhoneNumber</code> API, not the Amazon Connect console.</p> <p>After releasing a phone number, the phone number enters into a cooldown period of 30 days. It cannot be searched for or claimed again until the period has ended. If you accidentally release a phone number, contact Amazon Web Services Support.</p> </important> <p>If you plan to claim and release numbers frequently during a 30 day period, contact us for a service quota exception. Otherwise, it is possible you will be blocked from claiming and releasing any more numbers until 30 days past the oldest number released has expired.</p> <p>By default you can claim and release up to 200% of your maximum number of active phone numbers during any 30 day period. If you claim and release phone numbers using the UI or API during a rolling 30 day cycle that exceeds 200% of your phone number service level quota, you will be blocked from claiming any more numbers until 30 days past the oldest number released has expired. </p> <p>For example, if you already have 99 claimed numbers and a service level quota of 99 phone numbers, and in any 30 day period you release 99, claim 99, and then release 99, you will have exceeded the 200% limit. At that point you are blocked from claiming any more numbers until you open an Amazon Web Services support ticket.</p>\"\
    },\
    \"ReplicateInstance\":{\
      \"name\":\"ReplicateInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/instance/{InstanceId}/replicate\"\
      },\
      \"input\":{\"shape\":\"ReplicateInstanceRequest\"},\
      \"output\":{\"shape\":\"ReplicateInstanceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ResourceNotReadyException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Replicates an Amazon Connect instance in the specified Amazon Web Services Region.</p> <p>For more information about replicating an Amazon Connect instance, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/create-replica-connect-instance.html\\\">Create a replica of your existing Amazon Connect instance</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ResumeContactRecording\":{\
      \"name\":\"ResumeContactRecording\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/resume-recording\"\
      },\
      \"input\":{\"shape\":\"ResumeContactRecordingRequest\"},\
      \"output\":{\"shape\":\"ResumeContactRecordingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>When a contact is being recorded, and the recording has been suspended using SuspendContactRecording, this API resumes recording the call or screen.</p> <p>Voice and screen recordings are supported.</p>\"\
    },\
    \"SearchAvailablePhoneNumbers\":{\
      \"name\":\"SearchAvailablePhoneNumbers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/phone-number/search-available\"\
      },\
      \"input\":{\"shape\":\"SearchAvailablePhoneNumbersRequest\"},\
      \"output\":{\"shape\":\"SearchAvailablePhoneNumbersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Searches for available phone numbers that you can claim to your Amazon Connect instance or traffic distribution group. If the provided <code>TargetArn</code> is a traffic distribution group, you can call this API in both Amazon Web Services Regions associated with the traffic distribution group.</p>\"\
    },\
    \"SearchHoursOfOperations\":{\
      \"name\":\"SearchHoursOfOperations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/search-hours-of-operations\"\
      },\
      \"input\":{\"shape\":\"SearchHoursOfOperationsRequest\"},\
      \"output\":{\"shape\":\"SearchHoursOfOperationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Searches the hours of operation in an Amazon Connect instance, with optional filtering.</p>\"\
    },\
    \"SearchPrompts\":{\
      \"name\":\"SearchPrompts\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/search-prompts\"\
      },\
      \"input\":{\"shape\":\"SearchPromptsRequest\"},\
      \"output\":{\"shape\":\"SearchPromptsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Searches prompts in an Amazon Connect instance, with optional filtering.</p>\"\
    },\
    \"SearchQueues\":{\
      \"name\":\"SearchQueues\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/search-queues\"\
      },\
      \"input\":{\"shape\":\"SearchQueuesRequest\"},\
      \"output\":{\"shape\":\"SearchQueuesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Searches queues in an Amazon Connect instance, with optional filtering.</p>\"\
    },\
    \"SearchQuickConnects\":{\
      \"name\":\"SearchQuickConnects\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/search-quick-connects\"\
      },\
      \"input\":{\"shape\":\"SearchQuickConnectsRequest\"},\
      \"output\":{\"shape\":\"SearchQuickConnectsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Searches quick connects in an Amazon Connect instance, with optional filtering.</p>\"\
    },\
    \"SearchResourceTags\":{\
      \"name\":\"SearchResourceTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/search-resource-tags\"\
      },\
      \"input\":{\"shape\":\"SearchResourceTagsRequest\"},\
      \"output\":{\"shape\":\"SearchResourceTagsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"MaximumResultReturnedException\"}\
      ],\
      \"documentation\":\"<p>Searches tags used in an Amazon Connect instance using optional search criteria.</p>\"\
    },\
    \"SearchRoutingProfiles\":{\
      \"name\":\"SearchRoutingProfiles\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/search-routing-profiles\"\
      },\
      \"input\":{\"shape\":\"SearchRoutingProfilesRequest\"},\
      \"output\":{\"shape\":\"SearchRoutingProfilesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Searches routing profiles in an Amazon Connect instance, with optional filtering.</p>\"\
    },\
    \"SearchSecurityProfiles\":{\
      \"name\":\"SearchSecurityProfiles\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/search-security-profiles\"\
      },\
      \"input\":{\"shape\":\"SearchSecurityProfilesRequest\"},\
      \"output\":{\"shape\":\"SearchSecurityProfilesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Searches security profiles in an Amazon Connect instance, with optional filtering.</p>\"\
    },\
    \"SearchUsers\":{\
      \"name\":\"SearchUsers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/search-users\"\
      },\
      \"input\":{\"shape\":\"SearchUsersRequest\"},\
      \"output\":{\"shape\":\"SearchUsersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Searches users in an Amazon Connect instance, with optional filtering.</p> <note> <p> <code>AfterContactWorkTimeLimit</code> is returned in milliseconds. </p> </note>\"\
    },\
    \"SearchVocabularies\":{\
      \"name\":\"SearchVocabularies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/vocabulary-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"SearchVocabulariesRequest\"},\
      \"output\":{\"shape\":\"SearchVocabulariesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Searches for vocabularies within a specific Amazon Connect instance using <code>State</code>, <code>NameStartsWith</code>, and <code>LanguageCode</code>.</p>\"\
    },\
    \"StartChatContact\":{\
      \"name\":\"StartChatContact\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/contact/chat\"\
      },\
      \"input\":{\"shape\":\"StartChatContactRequest\"},\
      \"output\":{\"shape\":\"StartChatContactResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Initiates a flow to start a new chat for the customer. Response of this API provides a token required to obtain credentials from the <a href=\\\"https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html\\\">CreateParticipantConnection</a> API in the Amazon Connect Participant Service.</p> <p>When a new chat contact is successfully created, clients must subscribe to the participantâs connection for the created chat within 5 minutes. This is achieved by invoking <a href=\\\"https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html\\\">CreateParticipantConnection</a> with WEBSOCKET and CONNECTION_CREDENTIALS. </p> <p>A 429 error occurs in the following situations:</p> <ul> <li> <p>API rate limit is exceeded. API TPS throttling returns a <code>TooManyRequests</code> exception.</p> </li> <li> <p>The <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html\\\">quota for concurrent active chats</a> is exceeded. Active chat throttling returns a <code>LimitExceededException</code>.</p> </li> </ul> <p>If you use the <code>ChatDurationInMinutes</code> parameter and receive a 400 error, your account may not support the ability to configure custom chat durations. For more information, contact Amazon Web Services Support. </p> <p>For more information about chat, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/chat.html\\\">Chat</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"StartContactEvaluation\":{\
      \"name\":\"StartContactEvaluation\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/contact-evaluations/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"StartContactEvaluationRequest\"},\
      \"output\":{\"shape\":\"StartContactEvaluationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Starts an empty evaluation in the specified Amazon Connect instance, using the given evaluation form for the particular contact. The evaluation form version used for the contact evaluation corresponds to the currently activated version. If no version is activated for the evaluation form, the contact evaluation cannot be started. </p> <note> <p>Evaluations created through the public API do not contain answer values suggested from automation.</p> </note>\",\
      \"idempotent\":true\
    },\
    \"StartContactRecording\":{\
      \"name\":\"StartContactRecording\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/start-recording\"\
      },\
      \"input\":{\"shape\":\"StartContactRecordingRequest\"},\
      \"output\":{\"shape\":\"StartContactRecordingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Starts recording the contact: </p> <ul> <li> <p>If the API is called <i>before</i> the agent joins the call, recording starts when the agent joins the call.</p> </li> <li> <p>If the API is called <i>after</i> the agent joins the call, recording starts at the time of the API call.</p> </li> </ul> <p>StartContactRecording is a one-time action. For example, if you use StopContactRecording to stop recording an ongoing call, you can't use StartContactRecording to restart it. For scenarios where the recording has started and you want to suspend and resume it, such as when collecting sensitive information (for example, a credit card number), use SuspendContactRecording and ResumeContactRecording.</p> <p>You can use this API to override the recording behavior configured in the <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/set-recording-behavior.html\\\">Set recording behavior</a> block.</p> <p>Only voice recordings are supported at this time.</p>\"\
    },\
    \"StartContactStreaming\":{\
      \"name\":\"StartContactStreaming\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/start-streaming\"\
      },\
      \"input\":{\"shape\":\"StartContactStreamingRequest\"},\
      \"output\":{\"shape\":\"StartContactStreamingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p> Initiates real-time message streaming for a new chat contact.</p> <p> For more information about message streaming, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/chat-message-streaming.html\\\">Enable real-time chat message streaming</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"StartOutboundVoiceContact\":{\
      \"name\":\"StartOutboundVoiceContact\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/contact/outbound-voice\"\
      },\
      \"input\":{\"shape\":\"StartOutboundVoiceContactRequest\"},\
      \"output\":{\"shape\":\"StartOutboundVoiceContactResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"DestinationNotAllowedException\"},\
        {\"shape\":\"OutboundContactNotPermittedException\"}\
      ],\
      \"documentation\":\"<p>Places an outbound call to a contact, and then initiates the flow. It performs the actions in the flow that's specified (in <code>ContactFlowId</code>).</p> <p>Agents do not initiate the outbound API, which means that they do not dial the contact. If the flow places an outbound call to a contact, and then puts the contact in queue, the call is then routed to the agent, like any other inbound case.</p> <p>There is a 60-second dialing timeout for this operation. If the call is not connected after 60 seconds, it fails.</p> <note> <p>UK numbers with a 447 prefix are not allowed by default. Before you can dial these UK mobile numbers, you must submit a service quota increase request. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html\\\">Amazon Connect Service Quotas</a> in the <i>Amazon Connect Administrator Guide</i>. </p> </note> <note> <p>Campaign calls are not allowed by default. Before you can make a call with <code>TrafficType</code> = <code>CAMPAIGN</code>, you must submit a service quota increase request to the quota <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#outbound-communications-quotas\\\">Amazon Connect campaigns</a>. </p> </note>\"\
    },\
    \"StartTaskContact\":{\
      \"name\":\"StartTaskContact\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/contact/task\"\
      },\
      \"input\":{\"shape\":\"StartTaskContactRequest\"},\
      \"output\":{\"shape\":\"StartTaskContactResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Initiates a flow to start a new task.</p>\"\
    },\
    \"StopContact\":{\
      \"name\":\"StopContact\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/stop\"\
      },\
      \"input\":{\"shape\":\"StopContactRequest\"},\
      \"output\":{\"shape\":\"StopContactResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ContactNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Ends the specified contact. This call does not work for the following initiation methods:</p> <ul> <li> <p>DISCONNECT</p> </li> <li> <p>TRANSFER</p> </li> <li> <p>QUEUE_TRANSFER</p> </li> </ul>\"\
    },\
    \"StopContactRecording\":{\
      \"name\":\"StopContactRecording\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/stop-recording\"\
      },\
      \"input\":{\"shape\":\"StopContactRecordingRequest\"},\
      \"output\":{\"shape\":\"StopContactRecordingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Stops recording a call when a contact is being recorded. StopContactRecording is a one-time action. If you use StopContactRecording to stop recording an ongoing call, you can't use StartContactRecording to restart it. For scenarios where the recording has started and you want to suspend it for sensitive information (for example, to collect a credit card number), and then restart it, use SuspendContactRecording and ResumeContactRecording.</p> <p>Only voice recordings are supported at this time.</p>\"\
    },\
    \"StopContactStreaming\":{\
      \"name\":\"StopContactStreaming\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/stop-streaming\"\
      },\
      \"input\":{\"shape\":\"StopContactStreamingRequest\"},\
      \"output\":{\"shape\":\"StopContactStreamingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p> Ends message streaming on a specified contact. To restart message streaming on that contact, call the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_StartContactStreaming.html\\\">StartContactStreaming</a> API. </p>\"\
    },\
    \"SubmitContactEvaluation\":{\
      \"name\":\"SubmitContactEvaluation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact-evaluations/{InstanceId}/{EvaluationId}/submit\"\
      },\
      \"input\":{\"shape\":\"SubmitContactEvaluationRequest\"},\
      \"output\":{\"shape\":\"SubmitContactEvaluationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Submits a contact evaluation in the specified Amazon Connect instance. Answers included in the request are merged with existing answers for the given evaluation. If no answers or notes are passed, the evaluation is submitted with the existing answers and notes. You can delete an answer or note by passing an empty object (<code>{}</code>) to the question identifier. </p> <p>If a contact evaluation is already in submitted state, this operation will trigger a resubmission.</p>\"\
    },\
    \"SuspendContactRecording\":{\
      \"name\":\"SuspendContactRecording\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/suspend-recording\"\
      },\
      \"input\":{\"shape\":\"SuspendContactRecordingRequest\"},\
      \"output\":{\"shape\":\"SuspendContactRecordingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>When a contact is being recorded, this API suspends recording the call or screen. For example, you might suspend the call or screen recording while collecting sensitive information, such as a credit card number. Then use ResumeContactRecording to restart recording.</p> <p>The period of time that the recording is suspended is filled with silence in the final recording.</p> <p>Voice and screen recordings are supported.</p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tags/{resourceArn}\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Adds the specified tags to the specified resource.</p> <p>Some of the supported resource types are agents, routing profiles, queues, quick connects, contact flows, agent statuses, hours of operation, phone numbers, security profiles, and task templates. For a complete list, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/tagging.html\\\">Tagging resources in Amazon Connect</a>.</p> <p>For sample policies that use tags, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/security_iam_id-based-policy-examples.html\\\">Amazon Connect Identity-Based Policy Examples</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"TransferContact\":{\
      \"name\":\"TransferContact\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/transfer\"\
      },\
      \"input\":{\"shape\":\"TransferContactRequest\"},\
      \"output\":{\"shape\":\"TransferContactResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"IdempotencyException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Transfers contacts from one agent or queue to another agent or queue at any point after a contact is created. You can transfer a contact to another queue by providing the flow which orchestrates the contact to the destination queue. This gives you more control over contact handling and helps you adhere to the service level agreement (SLA) guaranteed to your customers.</p> <p>Note the following requirements:</p> <ul> <li> <p>Transfer is supported for only <code>TASK</code> contacts.</p> </li> <li> <p>Do not use both <code>QueueId</code> and <code>UserId</code> in the same call.</p> </li> <li> <p>The following flow types are supported: Inbound flow, Transfer to agent flow, and Transfer to queue flow.</p> </li> <li> <p>The <code>TransferContact</code> API can be called only on active contacts.</p> </li> <li> <p>A contact cannot be transferred more than 11 times.</p> </li> </ul>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/tags/{resourceArn}\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Removes the specified tags from the specified resource.</p>\"\
    },\
    \"UpdateAgentStatus\":{\
      \"name\":\"UpdateAgentStatus\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/agent-status/{InstanceId}/{AgentStatusId}\"\
      },\
      \"input\":{\"shape\":\"UpdateAgentStatusRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates agent status.</p>\"\
    },\
    \"UpdateContact\":{\
      \"name\":\"UpdateContact\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contacts/{InstanceId}/{ContactId}\"\
      },\
      \"input\":{\"shape\":\"UpdateContactRequest\"},\
      \"output\":{\"shape\":\"UpdateContactResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Adds or updates user-defined contact information associated with the specified contact. At least one field to be updated must be present in the request.</p> <important> <p>You can add or update user-defined contact information for both ongoing and completed contacts.</p> </important>\"\
    },\
    \"UpdateContactAttributes\":{\
      \"name\":\"UpdateContactAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/attributes\"\
      },\
      \"input\":{\"shape\":\"UpdateContactAttributesRequest\"},\
      \"output\":{\"shape\":\"UpdateContactAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates user-defined contact attributes associated with the specified contact.</p> <p>You can create or update user-defined attributes for both ongoing and completed contacts. For example, while the call is active, you can update the customer's name or the reason the customer called. You can add notes about steps that the agent took during the call that display to the next agent that takes the call. You can also update attributes for a contact using data from your CRM application and save the data with the contact in Amazon Connect. You could also flag calls for additional analysis, such as legal review or to identify abusive callers.</p> <p>Contact attributes are available in Amazon Connect for 24 months, and are then deleted. For information about contact record retention and the maximum size of the contact record attributes section, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits\\\">Feature specifications</a> in the <i>Amazon Connect Administrator Guide</i>. </p>\"\
    },\
    \"UpdateContactEvaluation\":{\
      \"name\":\"UpdateContactEvaluation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact-evaluations/{InstanceId}/{EvaluationId}\"\
      },\
      \"input\":{\"shape\":\"UpdateContactEvaluationRequest\"},\
      \"output\":{\"shape\":\"UpdateContactEvaluationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Updates details about a contact evaluation in the specified Amazon Connect instance. A contact evaluation must be in draft state. Answers included in the request are merged with existing answers for the given evaluation. An answer or note can be deleted by passing an empty object (<code>{}</code>) to the question identifier. </p>\"\
    },\
    \"UpdateContactFlowContent\":{\
      \"name\":\"UpdateContactFlowContent\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact-flows/{InstanceId}/{ContactFlowId}/content\"\
      },\
      \"input\":{\"shape\":\"UpdateContactFlowContentRequest\"},\
      \"output\":{\"shape\":\"UpdateContactFlowContentResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidContactFlowException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the specified flow.</p> <p>You can also create and update flows using the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/flow-language.html\\\">Amazon Connect Flow language</a>.</p>\"\
    },\
    \"UpdateContactFlowMetadata\":{\
      \"name\":\"UpdateContactFlowMetadata\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact-flows/{InstanceId}/{ContactFlowId}/metadata\"\
      },\
      \"input\":{\"shape\":\"UpdateContactFlowMetadataRequest\"},\
      \"output\":{\"shape\":\"UpdateContactFlowMetadataResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates metadata about specified flow.</p>\"\
    },\
    \"UpdateContactFlowModuleContent\":{\
      \"name\":\"UpdateContactFlowModuleContent\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}/content\"\
      },\
      \"input\":{\"shape\":\"UpdateContactFlowModuleContentRequest\"},\
      \"output\":{\"shape\":\"UpdateContactFlowModuleContentResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidContactFlowModuleException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates specified flow module for the specified Amazon Connect instance. </p>\"\
    },\
    \"UpdateContactFlowModuleMetadata\":{\
      \"name\":\"UpdateContactFlowModuleMetadata\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}/metadata\"\
      },\
      \"input\":{\"shape\":\"UpdateContactFlowModuleMetadataRequest\"},\
      \"output\":{\"shape\":\"UpdateContactFlowModuleMetadataResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates metadata about specified flow module.</p>\"\
    },\
    \"UpdateContactFlowName\":{\
      \"name\":\"UpdateContactFlowName\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact-flows/{InstanceId}/{ContactFlowId}/name\"\
      },\
      \"input\":{\"shape\":\"UpdateContactFlowNameRequest\"},\
      \"output\":{\"shape\":\"UpdateContactFlowNameResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>The name of the flow.</p> <p>You can also create and update flows using the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/flow-language.html\\\">Amazon Connect Flow language</a>.</p>\"\
    },\
    \"UpdateContactSchedule\":{\
      \"name\":\"UpdateContactSchedule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/schedule\"\
      },\
      \"input\":{\"shape\":\"UpdateContactScheduleRequest\"},\
      \"output\":{\"shape\":\"UpdateContactScheduleResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the scheduled time of a task contact that is already scheduled.</p>\"\
    },\
    \"UpdateEvaluationForm\":{\
      \"name\":\"UpdateEvaluationForm\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/evaluation-forms/{InstanceId}/{EvaluationFormId}\"\
      },\
      \"input\":{\"shape\":\"UpdateEvaluationFormRequest\"},\
      \"output\":{\"shape\":\"UpdateEvaluationFormResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Updates details about a specific evaluation form version in the specified Amazon Connect instance. Question and section identifiers cannot be duplicated within the same evaluation form.</p> <p>This operation does not support partial updates. Instead it does a full update of evaluation form content.</p>\",\
      \"idempotent\":true\
    },\
    \"UpdateHoursOfOperation\":{\
      \"name\":\"UpdateHoursOfOperation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/hours-of-operations/{InstanceId}/{HoursOfOperationId}\"\
      },\
      \"input\":{\"shape\":\"UpdateHoursOfOperationRequest\"},\
      \"errors\":[\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates the hours of operation.</p>\"\
    },\
    \"UpdateInstanceAttribute\":{\
      \"name\":\"UpdateInstanceAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/instance/{InstanceId}/attribute/{AttributeType}\"\
      },\
      \"input\":{\"shape\":\"UpdateInstanceAttributeRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates the value for the specified attribute type.</p>\"\
    },\
    \"UpdateInstanceStorageConfig\":{\
      \"name\":\"UpdateInstanceStorageConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/instance/{InstanceId}/storage-config/{AssociationId}\"\
      },\
      \"input\":{\"shape\":\"UpdateInstanceStorageConfigRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates an existing configuration for a resource type. This API is idempotent.</p>\"\
    },\
    \"UpdateParticipantRoleConfig\":{\
      \"name\":\"UpdateParticipantRoleConfig\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/contact/participant-role-config/{InstanceId}/{ContactId}\"\
      },\
      \"input\":{\"shape\":\"UpdateParticipantRoleConfigRequest\"},\
      \"output\":{\"shape\":\"UpdateParticipantRoleConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates timeouts for when human chat participants are to be considered idle, and when agents are automatically disconnected from a chat due to idleness. You can set four timers:</p> <ul> <li> <p>Customer idle timeout</p> </li> <li> <p>Customer auto-disconnect timeout</p> </li> <li> <p>Agent idle timeout</p> </li> <li> <p>Agent auto-disconnect timeout</p> </li> </ul> <p>For more information about how chat timeouts work, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/setup-chat-timeouts.html\\\">Set up chat timeouts for human participants</a>. </p>\"\
    },\
    \"UpdatePhoneNumber\":{\
      \"name\":\"UpdatePhoneNumber\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/phone-number/{PhoneNumberId}\"\
      },\
      \"input\":{\"shape\":\"UpdatePhoneNumberRequest\"},\
      \"output\":{\"shape\":\"UpdatePhoneNumberResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"IdempotencyException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Updates your claimed phone number from its current Amazon Connect instance or traffic distribution group to another Amazon Connect instance or traffic distribution group in the same Amazon Web Services Region.</p> <important> <p>After using this API, you must verify that the phone number is attached to the correct flow in the target instance or traffic distribution group. You need to do this because the API switches only the phone number to a new instance or traffic distribution group. It doesn't migrate the flow configuration of the phone number, too.</p> <p>You can call <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribePhoneNumber.html\\\">DescribePhoneNumber</a> API to verify the status of a previous <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdatePhoneNumber.html\\\">UpdatePhoneNumber</a> operation.</p> </important>\"\
    },\
    \"UpdatePrompt\":{\
      \"name\":\"UpdatePrompt\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/prompts/{InstanceId}/{PromptId}\"\
      },\
      \"input\":{\"shape\":\"UpdatePromptRequest\"},\
      \"output\":{\"shape\":\"UpdatePromptResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates a prompt.</p>\"\
    },\
    \"UpdateQueueHoursOfOperation\":{\
      \"name\":\"UpdateQueueHoursOfOperation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}/hours-of-operation\"\
      },\
      \"input\":{\"shape\":\"UpdateQueueHoursOfOperationRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates the hours of operation for the specified queue.</p>\"\
    },\
    \"UpdateQueueMaxContacts\":{\
      \"name\":\"UpdateQueueMaxContacts\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}/max-contacts\"\
      },\
      \"input\":{\"shape\":\"UpdateQueueMaxContactsRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates the maximum number of contacts allowed in a queue before it is considered full.</p>\"\
    },\
    \"UpdateQueueName\":{\
      \"name\":\"UpdateQueueName\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}/name\"\
      },\
      \"input\":{\"shape\":\"UpdateQueueNameRequest\"},\
      \"errors\":[\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates the name and description of a queue. At least <code>Name</code> or <code>Description</code> must be provided.</p>\"\
    },\
    \"UpdateQueueOutboundCallerConfig\":{\
      \"name\":\"UpdateQueueOutboundCallerConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}/outbound-caller-config\"\
      },\
      \"input\":{\"shape\":\"UpdateQueueOutboundCallerConfigRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates the outbound caller ID name, number, and outbound whisper flow for a specified queue.</p> <important> <p>If the number being used in the input is claimed to a traffic distribution group, and you are calling this API using an instance in the Amazon Web Services Region where the traffic distribution group was created, you can use either a full phone number ARN or UUID value for the <code>OutboundCallerIdNumberId</code> value of the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_OutboundCallerConfig\\\">OutboundCallerConfig</a> request body parameter. However, if the number is claimed to a traffic distribution group and you are calling this API using an instance in the alternate Amazon Web Services Region associated with the traffic distribution group, you must provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a <code>ResourceNotFoundException</code>.</p> <p>Only use the phone number ARN format that doesn't contain <code>instance</code> in the path, for example, <code>arn:aws:connect:us-east-1:1234567890:phone-number/uuid</code>. This is the same ARN format that is returned when you call the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_ListPhoneNumbersV2.html\\\">ListPhoneNumbersV2</a> API.</p> </important>\"\
    },\
    \"UpdateQueueStatus\":{\
      \"name\":\"UpdateQueueStatus\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}/status\"\
      },\
      \"input\":{\"shape\":\"UpdateQueueStatusRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates the status of the queue.</p>\"\
    },\
    \"UpdateQuickConnectConfig\":{\
      \"name\":\"UpdateQuickConnectConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/quick-connects/{InstanceId}/{QuickConnectId}/config\"\
      },\
      \"input\":{\"shape\":\"UpdateQuickConnectConfigRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the configuration settings for the specified quick connect.</p>\"\
    },\
    \"UpdateQuickConnectName\":{\
      \"name\":\"UpdateQuickConnectName\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/quick-connects/{InstanceId}/{QuickConnectId}/name\"\
      },\
      \"input\":{\"shape\":\"UpdateQuickConnectNameRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the name and description of a quick connect. The request accepts the following data in JSON format. At least <code>Name</code> or <code>Description</code> must be provided.</p>\"\
    },\
    \"UpdateRoutingProfileAgentAvailabilityTimer\":{\
      \"name\":\"UpdateRoutingProfileAgentAvailabilityTimer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}/{RoutingProfileId}/agent-availability-timer\"\
      },\
      \"input\":{\"shape\":\"UpdateRoutingProfileAgentAvailabilityTimerRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Whether agents with this routing profile will have their routing order calculated based on <i>time since their last inbound contact</i> or <i>longest idle time</i>. </p>\"\
    },\
    \"UpdateRoutingProfileConcurrency\":{\
      \"name\":\"UpdateRoutingProfileConcurrency\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}/{RoutingProfileId}/concurrency\"\
      },\
      \"input\":{\"shape\":\"UpdateRoutingProfileConcurrencyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the channels that agents can handle in the Contact Control Panel (CCP) for a routing profile.</p>\"\
    },\
    \"UpdateRoutingProfileDefaultOutboundQueue\":{\
      \"name\":\"UpdateRoutingProfileDefaultOutboundQueue\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}/{RoutingProfileId}/default-outbound-queue\"\
      },\
      \"input\":{\"shape\":\"UpdateRoutingProfileDefaultOutboundQueueRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the default outbound queue of a routing profile.</p>\"\
    },\
    \"UpdateRoutingProfileName\":{\
      \"name\":\"UpdateRoutingProfileName\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}/{RoutingProfileId}/name\"\
      },\
      \"input\":{\"shape\":\"UpdateRoutingProfileNameRequest\"},\
      \"errors\":[\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the name and description of a routing profile. The request accepts the following data in JSON format. At least <code>Name</code> or <code>Description</code> must be provided.</p>\"\
    },\
    \"UpdateRoutingProfileQueues\":{\
      \"name\":\"UpdateRoutingProfileQueues\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}/{RoutingProfileId}/queues\"\
      },\
      \"input\":{\"shape\":\"UpdateRoutingProfileQueuesRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the properties associated with a set of queues for a routing profile.</p>\"\
    },\
    \"UpdateRule\":{\
      \"name\":\"UpdateRule\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/rules/{InstanceId}/{RuleId}\"\
      },\
      \"input\":{\"shape\":\"UpdateRuleRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Updates a rule for the specified Amazon Connect instance.</p> <p>Use the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/connect-rules-language.html\\\">Rules Function language</a> to code conditions for the rule. </p>\"\
    },\
    \"UpdateSecurityProfile\":{\
      \"name\":\"UpdateSecurityProfile\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/security-profiles/{InstanceId}/{SecurityProfileId}\"\
      },\
      \"input\":{\"shape\":\"UpdateSecurityProfileRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates a security profile.</p>\"\
    },\
    \"UpdateTaskTemplate\":{\
      \"name\":\"UpdateTaskTemplate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/instance/{InstanceId}/task/template/{TaskTemplateId}\"\
      },\
      \"input\":{\"shape\":\"UpdateTaskTemplateRequest\"},\
      \"output\":{\"shape\":\"UpdateTaskTemplateResponse\"},\
      \"errors\":[\
        {\"shape\":\"PropertyValidationException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates details about a specific task template in the specified Amazon Connect instance. This operation does not support partial updates. Instead it does a full update of template content.</p>\"\
    },\
    \"UpdateTrafficDistribution\":{\
      \"name\":\"UpdateTrafficDistribution\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/traffic-distribution/{Id}\"\
      },\
      \"input\":{\"shape\":\"UpdateTrafficDistributionRequest\"},\
      \"output\":{\"shape\":\"UpdateTrafficDistributionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the traffic distribution for a given traffic distribution group. </p> <note> <p>You can change the <code>SignInConfig</code> only for a default <code>TrafficDistributionGroup</code>. If you call <code>UpdateTrafficDistribution</code> with a modified <code>SignInConfig</code> and a non-default <code>TrafficDistributionGroup</code>, an <code>InvalidRequestException</code> is returned.</p> </note> <p>For more information about updating a traffic distribution group, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/update-telephony-traffic-distribution.html\\\">Update telephony traffic distribution across Amazon Web Services Regions </a> in the <i>Amazon Connect Administrator Guide</i>. </p>\"\
    },\
    \"UpdateUserHierarchy\":{\
      \"name\":\"UpdateUserHierarchy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/users/{InstanceId}/{UserId}/hierarchy\"\
      },\
      \"input\":{\"shape\":\"UpdateUserHierarchyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Assigns the specified hierarchy group to the specified user.</p>\"\
    },\
    \"UpdateUserHierarchyGroupName\":{\
      \"name\":\"UpdateUserHierarchyGroupName\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/user-hierarchy-groups/{InstanceId}/{HierarchyGroupId}/name\"\
      },\
      \"input\":{\"shape\":\"UpdateUserHierarchyGroupNameRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the name of the user hierarchy group. </p>\"\
    },\
    \"UpdateUserHierarchyStructure\":{\
      \"name\":\"UpdateUserHierarchyStructure\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/user-hierarchy-structure/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"UpdateUserHierarchyStructureRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the user hierarchy structure: add, remove, and rename user hierarchy levels.</p>\"\
    },\
    \"UpdateUserIdentityInfo\":{\
      \"name\":\"UpdateUserIdentityInfo\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/users/{InstanceId}/{UserId}/identity-info\"\
      },\
      \"input\":{\"shape\":\"UpdateUserIdentityInfoRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the identity information for the specified user.</p> <important> <p>We strongly recommend limiting who has the ability to invoke <code>UpdateUserIdentityInfo</code>. Someone with that ability can change the login credentials of other users by changing their email address. This poses a security risk to your organization. They can change the email address of a user to the attacker's email address, and then reset the password through email. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/security-profile-best-practices.html\\\">Best Practices for Security Profiles</a> in the <i>Amazon Connect Administrator Guide</i>.</p> </important>\"\
    },\
    \"UpdateUserPhoneConfig\":{\
      \"name\":\"UpdateUserPhoneConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/users/{InstanceId}/{UserId}/phone-config\"\
      },\
      \"input\":{\"shape\":\"UpdateUserPhoneConfigRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the phone configuration settings for the specified user.</p>\"\
    },\
    \"UpdateUserRoutingProfile\":{\
      \"name\":\"UpdateUserRoutingProfile\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/users/{InstanceId}/{UserId}/routing-profile\"\
      },\
      \"input\":{\"shape\":\"UpdateUserRoutingProfileRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Assigns the specified routing profile to the specified user.</p>\"\
    },\
    \"UpdateUserSecurityProfiles\":{\
      \"name\":\"UpdateUserSecurityProfiles\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/users/{InstanceId}/{UserId}/security-profiles\"\
      },\
      \"input\":{\"shape\":\"UpdateUserSecurityProfilesRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Assigns the specified security profiles to the specified user.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"ARN\":{\"type\":\"string\"},\
    \"AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>You do not have sufficient permissions to perform this action.</p>\",\
      \"error\":{\"httpStatusCode\":403},\
      \"exception\":true\
    },\
    \"ActionSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ActionSummary\"}\
    },\
    \"ActionSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\"ActionType\"],\
      \"members\":{\
        \"ActionType\":{\
          \"shape\":\"ActionType\",\
          \"documentation\":\"<p>The action type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an action.</p>\"\
    },\
    \"ActionType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATE_TASK\",\
        \"ASSIGN_CONTACT_CATEGORY\",\
        \"GENERATE_EVENTBRIDGE_EVENT\",\
        \"SEND_NOTIFICATION\"\
      ]\
    },\
    \"ActivateEvaluationFormRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"EvaluationFormId\",\
        \"EvaluationFormVersion\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"EvaluationFormId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The unique identifier for the evaluation form.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EvaluationFormId\"\
        },\
        \"EvaluationFormVersion\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>The version of the evaluation form to activate. If the version property is not provided, the latest version of the evaluation form is activated.</p>\"\
        }\
      }\
    },\
    \"ActivateEvaluationFormResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EvaluationFormId\",\
        \"EvaluationFormArn\",\
        \"EvaluationFormVersion\"\
      ],\
      \"members\":{\
        \"EvaluationFormId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The unique identifier for the evaluation form.</p>\"\
        },\
        \"EvaluationFormArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the evaluation form resource.</p>\"\
        },\
        \"EvaluationFormVersion\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>A version of the evaluation form.</p>\"\
        }\
      }\
    },\
    \"AfterContactWorkTimeLimit\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"AgentAvailabilityTimer\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TIME_SINCE_LAST_ACTIVITY\",\
        \"TIME_SINCE_LAST_INBOUND\"\
      ]\
    },\
    \"AgentConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"Distributions\"],\
      \"members\":{\
        \"Distributions\":{\
          \"shape\":\"DistributionList\",\
          \"documentation\":\"<p>Information about traffic distributions.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The distribution of agents between the instance and its replica(s).</p>\"\
    },\
    \"AgentContactReference\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact in this instance of Amazon Connect. </p>\"\
        },\
        \"Channel\":{\
          \"shape\":\"Channel\",\
          \"documentation\":\"<p>The channel of the contact.</p>\"\
        },\
        \"InitiationMethod\":{\
          \"shape\":\"ContactInitiationMethod\",\
          \"documentation\":\"<p>How the contact was initiated.</p>\"\
        },\
        \"AgentContactState\":{\
          \"shape\":\"ContactState\",\
          \"documentation\":\"<p>The <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/about-contact-states.html\\\">state of the contact</a>.</p>\"\
        },\
        \"StateStartTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The epoch timestamp when the contact state started.</p>\"\
        },\
        \"ConnectedToAgentTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the contact was connected to an agent.</p>\"\
        },\
        \"Queue\":{\"shape\":\"QueueReference\"}\
      },\
      \"documentation\":\"<p>Information about the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_Contact.html\\\">contact</a> associated to the user.</p>\"\
    },\
    \"AgentContactReferenceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AgentContactReference\"}\
    },\
    \"AgentFirstName\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"AgentInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"AgentResourceId\",\
          \"documentation\":\"<p>The identifier of the agent who accepted the contact.</p>\"\
        },\
        \"ConnectedToAgentTimestamp\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp when the contact was connected to the agent.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the agent who accepted the contact.</p>\"\
    },\
    \"AgentLastName\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"AgentResourceId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"AgentStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AgentStatusARN\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the agent status.</p>\"\
        },\
        \"AgentStatusId\":{\
          \"shape\":\"AgentStatusId\",\
          \"documentation\":\"<p>The identifier of the agent status.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"AgentStatusName\",\
          \"documentation\":\"<p>The name of the agent status.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"AgentStatusDescription\",\
          \"documentation\":\"<p>The description of the agent status.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"AgentStatusType\",\
          \"documentation\":\"<p>The type of agent status.</p>\"\
        },\
        \"DisplayOrder\":{\
          \"shape\":\"AgentStatusOrderNumber\",\
          \"documentation\":\"<p>The display order of the agent status.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"AgentStatusState\",\
          \"documentation\":\"<p>The state of the agent status.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about an agent status.</p>\"\
    },\
    \"AgentStatusDescription\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":1\
    },\
    \"AgentStatusId\":{\"type\":\"string\"},\
    \"AgentStatusName\":{\
      \"type\":\"string\",\
      \"max\":127,\
      \"min\":1\
    },\
    \"AgentStatusOrderNumber\":{\
      \"type\":\"integer\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"AgentStatusReference\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StatusStartTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start timestamp of the agent's status.</p>\"\
        },\
        \"StatusArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the agent's status.</p>\"\
        },\
        \"StatusName\":{\
          \"shape\":\"AgentStatusName\",\
          \"documentation\":\"<p>The name of the agent status.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the agent's status.</p>\"\
    },\
    \"AgentStatusState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENABLED\",\
        \"DISABLED\"\
      ]\
    },\
    \"AgentStatusSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"AgentStatusId\",\
          \"documentation\":\"<p>The identifier for an agent status.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the agent status.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"AgentStatusName\",\
          \"documentation\":\"<p>The name of the agent status.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"AgentStatusType\",\
          \"documentation\":\"<p>The type of the agent status.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary information for an agent status.</p>\"\
    },\
    \"AgentStatusSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AgentStatusSummary\"}\
    },\
    \"AgentStatusType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ROUTABLE\",\
        \"CUSTOM\",\
        \"OFFLINE\"\
      ]\
    },\
    \"AgentStatusTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AgentStatusType\"},\
      \"max\":3\
    },\
    \"AgentUsername\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"AgentsMinOneMaxHundred\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserId\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"AliasArn\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"AllowedAccessControlTags\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"SecurityProfilePolicyKey\"},\
      \"value\":{\"shape\":\"SecurityProfilePolicyValue\"},\
      \"max\":2\
    },\
    \"AllowedMonitorCapabilities\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MonitorCapability\"},\
      \"max\":2\
    },\
    \"AnswerMachineDetectionConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EnableAnswerMachineDetection\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>The flag to indicate if answer machine detection analysis needs to be performed for a voice call. If set to <code>true</code>, <code>TrafficType</code> must be set as <code>CAMPAIGN</code>. </p>\"\
        },\
        \"AwaitAnswerMachinePrompt\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Wait for the answering machine prompt.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration of the answering machine detection.</p>\"\
    },\
    \"ApproximateTotalCount\":{\"type\":\"long\"},\
    \"AssignContactCategoryActionDefinition\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>This action must be set if <code>TriggerEventSource</code> is one of the following values: <code>OnPostCallAnalysisAvailable</code> | <code>OnRealTimeCallAnalysisAvailable</code> | <code>OnPostChatAnalysisAvailable</code>. Contact is categorized using the rule name.</p> <p> <code>RuleName</code> is used as <code>ContactCategory</code>.</p>\"\
    },\
    \"AssociateApprovedOriginRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Origin\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Origin\":{\
          \"shape\":\"Origin\",\
          \"documentation\":\"<p>The domain to add to your allow list.</p>\"\
        }\
      }\
    },\
    \"AssociateBotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"LexBot\":{\"shape\":\"LexBot\"},\
        \"LexV2Bot\":{\
          \"shape\":\"LexV2Bot\",\
          \"documentation\":\"<p>The Amazon Lex V2 bot to associate with the instance.</p>\"\
        }\
      }\
    },\
    \"AssociateDefaultVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"VocabularyLanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html\\\">What is Amazon Transcribe?</a> </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"LanguageCode\"\
        },\
        \"VocabularyId\":{\
          \"shape\":\"VocabularyId\",\
          \"documentation\":\"<p>The identifier of the custom vocabulary. If this is empty, the default is set to none.</p>\"\
        }\
      }\
    },\
    \"AssociateDefaultVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"AssociateInstanceStorageConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ResourceType\",\
        \"StorageConfig\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"InstanceStorageResourceType\",\
          \"documentation\":\"<p>A valid resource type.</p>\"\
        },\
        \"StorageConfig\":{\
          \"shape\":\"InstanceStorageConfig\",\
          \"documentation\":\"<p>A valid storage type.</p>\"\
        }\
      }\
    },\
    \"AssociateInstanceStorageConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AssociationId\":{\
          \"shape\":\"AssociationId\",\
          \"documentation\":\"<p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>\"\
        }\
      }\
    },\
    \"AssociateLambdaFunctionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"FunctionArn\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"FunctionArn\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the Lambda function being associated. Maximum number of characters allowed is 140.</p>\"\
        }\
      }\
    },\
    \"AssociateLexBotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"LexBot\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"LexBot\":{\
          \"shape\":\"LexBot\",\
          \"documentation\":\"<p>The Amazon Lex bot to associate with the instance.</p>\"\
        }\
      }\
    },\
    \"AssociatePhoneNumberContactFlowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PhoneNumberId\",\
        \"InstanceId\",\
        \"ContactFlowId\"\
      ],\
      \"members\":{\
        \"PhoneNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>A unique identifier for the phone number.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"PhoneNumberId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow.</p>\"\
        }\
      }\
    },\
    \"AssociateQueueQuickConnectsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\",\
        \"QuickConnectIds\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        },\
        \"QuickConnectIds\":{\
          \"shape\":\"QuickConnectsList\",\
          \"documentation\":\"<p>The quick connects to associate with this queue.</p>\"\
        }\
      }\
    },\
    \"AssociateRoutingProfileQueuesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RoutingProfileId\",\
        \"QueueConfigs\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RoutingProfileId\"\
        },\
        \"QueueConfigs\":{\
          \"shape\":\"RoutingProfileQueueConfigList\",\
          \"documentation\":\"<p>The queues to associate with this routing profile.</p>\"\
        }\
      }\
    },\
    \"AssociateSecurityKeyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Key\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Key\":{\
          \"shape\":\"PEM\",\
          \"documentation\":\"<p>A valid security key in PEM format.</p>\"\
        }\
      }\
    },\
    \"AssociateSecurityKeyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AssociationId\":{\
          \"shape\":\"AssociationId\",\
          \"documentation\":\"<p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>\"\
        }\
      }\
    },\
    \"AssociateTrafficDistributionGroupUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrafficDistributionGroupId\",\
        \"UserId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"TrafficDistributionGroupId\":{\
          \"shape\":\"TrafficDistributionGroupIdOrArn\",\
          \"documentation\":\"<p>The identifier of the traffic distribution group. This can be the ID or the ARN if the API is being called in the Region where the traffic distribution group was created. The ARN must be provided if the call is from the replicated Region.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrafficDistributionGroupId\"\
        },\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account. This can be the ID or the ARN of the user. </p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        }\
      }\
    },\
    \"AssociateTrafficDistributionGroupUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"AssociationId\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"AttachmentReference\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ReferenceKey\",\
          \"documentation\":\"<p>Identifier of the attachment reference.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"ReferenceValue\",\
          \"documentation\":\"<p>The location path of the attachment reference.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ReferenceStatus\",\
          \"documentation\":\"<p>Status of the attachment reference type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a reference when the <code>referenceType</code> is <code>ATTACHMENT</code>. Otherwise, null.</p>\"\
    },\
    \"Attribute\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AttributeType\":{\
          \"shape\":\"InstanceAttributeType\",\
          \"documentation\":\"<p>The type of attribute.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"InstanceAttributeValue\",\
          \"documentation\":\"<p>The value of the attribute.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A toggle for an individual feature at the instance level.</p>\"\
    },\
    \"AttributeName\":{\
      \"type\":\"string\",\
      \"max\":32767,\
      \"min\":1\
    },\
    \"AttributeValue\":{\
      \"type\":\"string\",\
      \"max\":32767,\
      \"min\":0\
    },\
    \"Attributes\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"AttributeName\"},\
      \"value\":{\"shape\":\"AttributeValue\"}\
    },\
    \"AttributesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Attribute\"}\
    },\
    \"AutoAccept\":{\"type\":\"boolean\"},\
    \"AvailableNumberSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PhoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number. Phone numbers are formatted <code>[+] [country code] [subscriber number including area code]</code>.</p>\"\
        },\
        \"PhoneNumberCountryCode\":{\
          \"shape\":\"PhoneNumberCountryCode\",\
          \"documentation\":\"<p>The ISO country code.</p>\"\
        },\
        \"PhoneNumberType\":{\
          \"shape\":\"PhoneNumberType\",\
          \"documentation\":\"<p>The type of phone number.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about available phone numbers.</p>\"\
    },\
    \"AvailableNumbersList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AvailableNumberSummary\"}\
    },\
    \"AwsRegion\":{\
      \"type\":\"string\",\
      \"max\":31,\
      \"min\":8,\
      \"pattern\":\"[a-z]{2}(-[a-z]+){1,2}(-[0-9])?\"\
    },\
    \"BehaviorType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ROUTE_CURRENT_CHANNEL_ONLY\",\
        \"ROUTE_ANY_CHANNEL\"\
      ]\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"BotName\":{\
      \"type\":\"string\",\
      \"max\":50\
    },\
    \"BoxedBoolean\":{\
      \"type\":\"boolean\",\
      \"box\":true\
    },\
    \"BucketName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"CampaignId\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"Channel\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"VOICE\",\
        \"CHAT\",\
        \"TASK\"\
      ]\
    },\
    \"ChannelToCountMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"Channel\"},\
      \"value\":{\"shape\":\"IntegerCount\"}\
    },\
    \"Channels\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Channel\"},\
      \"max\":3\
    },\
    \"ChatContent\":{\
      \"type\":\"string\",\
      \"max\":16384,\
      \"min\":1\
    },\
    \"ChatContentType\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"ChatDurationInMinutes\":{\
      \"type\":\"integer\",\
      \"max\":10080,\
      \"min\":60\
    },\
    \"ChatMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ContentType\",\
        \"Content\"\
      ],\
      \"members\":{\
        \"ContentType\":{\
          \"shape\":\"ChatContentType\",\
          \"documentation\":\"<p>The type of the content. Supported types are <code>text/plain</code>, <code>text/markdown</code>, <code>application/json</code>, and <code>application/vnd.amazonaws.connect.message.interactive.response</code>.</p>\"\
        },\
        \"Content\":{\
          \"shape\":\"ChatContent\",\
          \"documentation\":\"<p>The content of the chat message. </p> <ul> <li> <p>For <code>text/plain</code> and <code>text/markdown</code>, the Length Constraints are Minimum of 1, Maximum of 1024. </p> </li> <li> <p>For <code>application/json</code>, the Length Constraints are Minimum of 1, Maximum of 12000. </p> </li> <li> <p>For <code>application/vnd.amazonaws.connect.message.interactive.response</code>, the Length Constraints are Minimum of 1, Maximum of 12288.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>A chat message.</p>\"\
    },\
    \"ChatParticipantRoleConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"ParticipantTimerConfigList\"],\
      \"members\":{\
        \"ParticipantTimerConfigList\":{\
          \"shape\":\"ParticipantTimerConfigList\",\
          \"documentation\":\"<p>A list of participant timers. You can specify any unique combination of role and timer type. Duplicate entries error out the request with a 400.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information for the chat participant role.</p>\"\
    },\
    \"ChatStreamingConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"StreamingEndpointArn\"],\
      \"members\":{\
        \"StreamingEndpointArn\":{\
          \"shape\":\"ChatStreamingEndpointARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the standard Amazon SNS topic. The Amazon Resource Name (ARN) of the streaming endpoint that is used to publish real-time message streaming for chat conversations.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The streaming configuration, such as the Amazon SNS streaming endpoint.</p>\"\
    },\
    \"ChatStreamingEndpointARN\":{\
      \"type\":\"string\",\
      \"max\":350,\
      \"min\":1\
    },\
    \"ClaimPhoneNumberRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TargetArn\",\
        \"PhoneNumber\"\
      ],\
      \"members\":{\
        \"TargetArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for Amazon Connect instances or traffic distribution groups that phone numbers are claimed to.</p>\"\
        },\
        \"PhoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number you want to claim. Phone numbers are formatted <code>[+] [country code] [subscriber number including area code]</code>.</p>\"\
        },\
        \"PhoneNumberDescription\":{\
          \"shape\":\"PhoneNumberDescription\",\
          \"documentation\":\"<p>The description of the phone number.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>.</p> <p>Pattern: <code>^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$</code> </p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"ClaimPhoneNumberResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PhoneNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>A unique identifier for the phone number.</p>\"\
        },\
        \"PhoneNumberArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the phone number.</p>\"\
        }\
      }\
    },\
    \"ClaimedPhoneNumberSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PhoneNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>A unique identifier for the phone number.</p>\"\
        },\
        \"PhoneNumberArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the phone number.</p>\"\
        },\
        \"PhoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number. Phone numbers are formatted <code>[+] [country code] [subscriber number including area code]</code>.</p>\"\
        },\
        \"PhoneNumberCountryCode\":{\
          \"shape\":\"PhoneNumberCountryCode\",\
          \"documentation\":\"<p>The ISO country code.</p>\"\
        },\
        \"PhoneNumberType\":{\
          \"shape\":\"PhoneNumberType\",\
          \"documentation\":\"<p>The type of phone number.</p>\"\
        },\
        \"PhoneNumberDescription\":{\
          \"shape\":\"PhoneNumberDescription\",\
          \"documentation\":\"<p>The description of the phone number.</p>\"\
        },\
        \"TargetArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for Amazon Connect instances or traffic distribution groups that phone numbers are claimed to.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        },\
        \"PhoneNumberStatus\":{\
          \"shape\":\"PhoneNumberStatus\",\
          \"documentation\":\"<p>The status of the phone number.</p> <ul> <li> <p> <code>CLAIMED</code> means the previous <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_ClaimedPhoneNumber.html\\\">ClaimedPhoneNumber</a> or <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdatePhoneNumber.html\\\">UpdatePhoneNumber</a> operation succeeded.</p> </li> <li> <p> <code>IN_PROGRESS</code> means a <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_ClaimedPhoneNumber.html\\\">ClaimedPhoneNumber</a> or <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdatePhoneNumber.html\\\">UpdatePhoneNumber</a> operation is still in progress and has not yet completed. You can call <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribePhoneNumber.html\\\">DescribePhoneNumber</a> at a later time to verify if the previous operation has completed.</p> </li> <li> <p> <code>FAILED</code> indicates that the previous <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_ClaimedPhoneNumber.html\\\">ClaimedPhoneNumber</a> or <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdatePhoneNumber.html\\\">UpdatePhoneNumber</a> operation has failed. It will include a message indicating the failure reason. A common reason for a failure may be that the <code>TargetArn</code> value you are claiming or updating a phone number to has reached its limit of total claimed numbers. If you received a <code>FAILED</code> status from a <code>ClaimPhoneNumber</code> API call, you have one day to retry claiming the phone number before the number is released back to the inventory for other customers to claim.</p> </li> </ul> <note> <p>You will not be billed for the phone number during the 1-day period if number claiming fails. </p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a phone number that has been claimed to your Amazon Connect instance or traffic distribution group.</p>\"\
    },\
    \"ClientToken\":{\
      \"type\":\"string\",\
      \"max\":500\
    },\
    \"CommonNameLength127\":{\
      \"type\":\"string\",\
      \"max\":127,\
      \"min\":1\
    },\
    \"Comparison\":{\
      \"type\":\"string\",\
      \"enum\":[\"LT\"]\
    },\
    \"Concurrency\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":1\
    },\
    \"Contact\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the contact.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier for the contact.</p>\"\
        },\
        \"InitialContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>If this contact is related to other contacts, this is the ID of the initial contact.</p>\"\
        },\
        \"PreviousContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>If this contact is not the first contact, this is the ID of the previous contact.</p>\"\
        },\
        \"InitiationMethod\":{\
          \"shape\":\"ContactInitiationMethod\",\
          \"documentation\":\"<p>Indicates how the contact was initiated.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of the contact.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the contact.</p>\"\
        },\
        \"Channel\":{\
          \"shape\":\"Channel\",\
          \"documentation\":\"<p>How the contact reached your contact center.</p>\"\
        },\
        \"QueueInfo\":{\
          \"shape\":\"QueueInfo\",\
          \"documentation\":\"<p>If this contact was queued, this contains information about the queue. </p>\"\
        },\
        \"AgentInfo\":{\
          \"shape\":\"AgentInfo\",\
          \"documentation\":\"<p>Information about the agent who accepted the contact.</p>\"\
        },\
        \"InitiationTimestamp\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time this contact was initiated, in UTC time. For <code>INBOUND</code>, this is when the contact arrived. For <code>OUTBOUND</code>, this is when the agent began dialing. For <code>CALLBACK</code>, this is when the callback contact was created. For <code>TRANSFER</code> and <code>QUEUE_TRANSFER</code>, this is when the transfer was initiated. For <code>API</code>, this is when the request arrived. For <code>EXTERNAL_OUTBOUND</code>, this is when the agent started dialing the external participant. For <code>MONITOR</code>, this is when the supervisor started listening to a contact.</p>\"\
        },\
        \"DisconnectTimestamp\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp when the customer endpoint disconnected from Amazon Connect.</p>\"\
        },\
        \"LastUpdateTimestamp\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp when contact was last updated.</p>\"\
        },\
        \"ScheduledTimestamp\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp, in Unix epoch time format, at which to start running the inbound flow. </p>\"\
        },\
        \"RelatedContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The contactId that is <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/chat-persistence.html#relatedcontactid\\\">related</a> to this contact.</p>\"\
        },\
        \"WisdomInfo\":{\
          \"shape\":\"WisdomInfo\",\
          \"documentation\":\"<p>Information about Amazon Connect Wisdom.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a contact.</p>\"\
    },\
    \"ContactFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactStates\":{\
          \"shape\":\"ContactStates\",\
          \"documentation\":\"<p>A list of up to 9 <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/about-contact-states.html\\\">contact states</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Filters user data based on the contact information that is associated to the users. It contains a list of <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/about-contact-states.html\\\">contact states</a>.</p>\"\
    },\
    \"ContactFlow\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the flow.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ContactFlowName\",\
          \"documentation\":\"<p>The name of the flow.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"ContactFlowType\",\
          \"documentation\":\"<p>The type of the flow. For descriptions of the available types, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/create-contact-flow.html#contact-flow-types\\\">Choose a flow type</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"ContactFlowState\",\
          \"documentation\":\"<p>The type of flow.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ContactFlowDescription\",\
          \"documentation\":\"<p>The description of the flow.</p>\"\
        },\
        \"Content\":{\
          \"shape\":\"ContactFlowContent\",\
          \"documentation\":\"<p>The content of the flow.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a flow.</p>\"\
    },\
    \"ContactFlowContent\":{\"type\":\"string\"},\
    \"ContactFlowDescription\":{\"type\":\"string\"},\
    \"ContactFlowId\":{\
      \"type\":\"string\",\
      \"max\":500\
    },\
    \"ContactFlowModule\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN).</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"ContactFlowModuleId\",\
          \"documentation\":\"<p>The identifier of the flow module.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ContactFlowModuleName\",\
          \"documentation\":\"<p>The name of the flow module.</p>\"\
        },\
        \"Content\":{\
          \"shape\":\"ContactFlowModuleContent\",\
          \"documentation\":\"<p>The content of the flow module.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ContactFlowModuleDescription\",\
          \"documentation\":\"<p>The description of the flow module.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"ContactFlowModuleState\",\
          \"documentation\":\"<p>The type of flow module.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ContactFlowModuleStatus\",\
          \"documentation\":\"<p>The status of the flow module.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a flow module.</p>\"\
    },\
    \"ContactFlowModuleContent\":{\
      \"type\":\"string\",\
      \"max\":256000,\
      \"min\":1\
    },\
    \"ContactFlowModuleDescription\":{\
      \"type\":\"string\",\
      \"max\":500,\
      \"min\":0,\
      \"pattern\":\".*\\\\S.*\"\
    },\
    \"ContactFlowModuleId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"ContactFlowModuleName\":{\
      \"type\":\"string\",\
      \"max\":127,\
      \"min\":1,\
      \"pattern\":\".*\\\\S.*\"\
    },\
    \"ContactFlowModuleState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACTIVE\",\
        \"ARCHIVED\"\
      ]\
    },\
    \"ContactFlowModuleStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PUBLISHED\",\
        \"SAVED\"\
      ]\
    },\
    \"ContactFlowModuleSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ContactFlowModuleId\",\
          \"documentation\":\"<p>The identifier of the flow module.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the flow module.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ContactFlowModuleName\",\
          \"documentation\":\"<p>The name of the flow module.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"ContactFlowModuleState\",\
          \"documentation\":\"<p>The type of flow module.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a flow.</p>\"\
    },\
    \"ContactFlowModulesSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContactFlowModuleSummary\"}\
    },\
    \"ContactFlowName\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"ContactFlowNotPublishedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>The flow has not been published.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"ContactFlowState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACTIVE\",\
        \"ARCHIVED\"\
      ]\
    },\
    \"ContactFlowSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the flow.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ContactFlowName\",\
          \"documentation\":\"<p>The name of the flow.</p>\"\
        },\
        \"ContactFlowType\":{\
          \"shape\":\"ContactFlowType\",\
          \"documentation\":\"<p>The type of flow.</p>\"\
        },\
        \"ContactFlowState\":{\
          \"shape\":\"ContactFlowState\",\
          \"documentation\":\"<p>The type of flow.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a flow.</p> <p>You can also create and update flows using the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/flow-language.html\\\">Amazon Connect Flow language</a>.</p>\"\
    },\
    \"ContactFlowSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContactFlowSummary\"}\
    },\
    \"ContactFlowType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CONTACT_FLOW\",\
        \"CUSTOMER_QUEUE\",\
        \"CUSTOMER_HOLD\",\
        \"CUSTOMER_WHISPER\",\
        \"AGENT_HOLD\",\
        \"AGENT_WHISPER\",\
        \"OUTBOUND_WHISPER\",\
        \"AGENT_TRANSFER\",\
        \"QUEUE_TRANSFER\"\
      ]\
    },\
    \"ContactFlowTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContactFlowType\"},\
      \"max\":10\
    },\
    \"ContactId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"ContactInitiationMethod\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INBOUND\",\
        \"OUTBOUND\",\
        \"TRANSFER\",\
        \"QUEUE_TRANSFER\",\
        \"CALLBACK\",\
        \"API\",\
        \"DISCONNECT\",\
        \"MONITOR\",\
        \"EXTERNAL_OUTBOUND\"\
      ]\
    },\
    \"ContactNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The contact with the specified ID is not active or does not exist. Applies to Voice calls only, not to Chat, Task, or Voice Callback.</p>\",\
      \"error\":{\"httpStatusCode\":410},\
      \"exception\":true\
    },\
    \"ContactReferences\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ReferenceKey\"},\
      \"value\":{\"shape\":\"Reference\"}\
    },\
    \"ContactState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INCOMING\",\
        \"PENDING\",\
        \"CONNECTING\",\
        \"CONNECTED\",\
        \"CONNECTED_ONHOLD\",\
        \"MISSED\",\
        \"ERROR\",\
        \"ENDED\",\
        \"REJECTED\"\
      ]\
    },\
    \"ContactStates\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContactState\"},\
      \"max\":9\
    },\
    \"Content\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"ControlPlaneTagFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OrConditions\":{\
          \"shape\":\"TagOrConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an <code>OR</code> condition. </p>\"\
        },\
        \"AndConditions\":{\
          \"shape\":\"TagAndConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an <code>AND</code> condition.</p>\"\
        },\
        \"TagCondition\":{\
          \"shape\":\"TagCondition\",\
          \"documentation\":\"<p>A leaf node condition which can be used to specify a tag condition. </p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that can be used to specify Tag conditions inside the <code>SearchFilter</code>. This accepts an <code>OR</code> of <code>AND</code> (List of List) input where: </p> <ul> <li> <p>Top level list specifies conditions that need to be applied with <code>OR</code> operator</p> </li> <li> <p>Inner list specifies conditions that need to be applied with <code>AND</code> operator.</p> </li> </ul>\"\
    },\
    \"CreateAgentStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\",\
        \"State\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"AgentStatusName\",\
          \"documentation\":\"<p>The name of the status.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"AgentStatusDescription\",\
          \"documentation\":\"<p>The description of the status.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"AgentStatusState\",\
          \"documentation\":\"<p>The state of the status.</p>\"\
        },\
        \"DisplayOrder\":{\
          \"shape\":\"AgentStatusOrderNumber\",\
          \"documentation\":\"<p>The display order of the status.</p>\",\
          \"box\":true\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      }\
    },\
    \"CreateAgentStatusResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AgentStatusARN\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the agent status.</p>\"\
        },\
        \"AgentStatusId\":{\
          \"shape\":\"AgentStatusId\",\
          \"documentation\":\"<p>The identifier of the agent status.</p>\"\
        }\
      }\
    },\
    \"CreateContactFlowModuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\",\
        \"Content\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"ContactFlowModuleName\",\
          \"documentation\":\"<p>The name of the flow module.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ContactFlowModuleDescription\",\
          \"documentation\":\"<p>The description of the flow module. </p>\"\
        },\
        \"Content\":{\
          \"shape\":\"ContactFlowModuleContent\",\
          \"documentation\":\"<p>The content of the flow module.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"CreateContactFlowModuleResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ContactFlowModuleId\",\
          \"documentation\":\"<p>The identifier of the flow module.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the flow module.</p>\"\
        }\
      }\
    },\
    \"CreateContactFlowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\",\
        \"Type\",\
        \"Content\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"ContactFlowName\",\
          \"documentation\":\"<p>The name of the flow.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"ContactFlowType\",\
          \"documentation\":\"<p>The type of the flow. For descriptions of the available types, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/create-contact-flow.html#contact-flow-types\\\">Choose a flow type</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ContactFlowDescription\",\
          \"documentation\":\"<p>The description of the flow. </p>\"\
        },\
        \"Content\":{\
          \"shape\":\"ContactFlowContent\",\
          \"documentation\":\"<p>The content of the flow. </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      }\
    },\
    \"CreateContactFlowResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow.</p>\"\
        },\
        \"ContactFlowArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the flow.</p>\"\
        }\
      }\
    },\
    \"CreateEvaluationFormRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Title\",\
        \"Items\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Title\":{\
          \"shape\":\"EvaluationFormTitle\",\
          \"documentation\":\"<p>A title of the evaluation form.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"EvaluationFormDescription\",\
          \"documentation\":\"<p>The description of the evaluation form.</p>\"\
        },\
        \"Items\":{\
          \"shape\":\"EvaluationFormItemsList\",\
          \"documentation\":\"<p>Items that are part of the evaluation form. The total number of sections and questions must not exceed 100 each. Questions must be contained in a section.</p>\"\
        },\
        \"ScoringStrategy\":{\
          \"shape\":\"EvaluationFormScoringStrategy\",\
          \"documentation\":\"<p>A scoring strategy of the evaluation form.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"CreateEvaluationFormResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EvaluationFormId\",\
        \"EvaluationFormArn\"\
      ],\
      \"members\":{\
        \"EvaluationFormId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The unique identifier for the evaluation form.</p>\"\
        },\
        \"EvaluationFormArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the evaluation form resource.</p>\"\
        }\
      }\
    },\
    \"CreateHoursOfOperationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\",\
        \"TimeZone\",\
        \"Config\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"CommonNameLength127\",\
          \"documentation\":\"<p>The name of the hours of operation.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"HoursOfOperationDescription\",\
          \"documentation\":\"<p>The description of the hours of operation.</p>\"\
        },\
        \"TimeZone\":{\
          \"shape\":\"TimeZone\",\
          \"documentation\":\"<p>The time zone of the hours of operation.</p>\"\
        },\
        \"Config\":{\
          \"shape\":\"HoursOfOperationConfigList\",\
          \"documentation\":\"<p>Configuration information for the hours of operation: day, start time, and end time.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      }\
    },\
    \"CreateHoursOfOperationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HoursOfOperationId\":{\
          \"shape\":\"HoursOfOperationId\",\
          \"documentation\":\"<p>The identifier for the hours of operation.</p>\"\
        },\
        \"HoursOfOperationArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the hours of operation.</p>\"\
        }\
      }\
    },\
    \"CreateInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityManagementType\",\
        \"InboundCallsEnabled\",\
        \"OutboundCallsEnabled\"\
      ],\
      \"members\":{\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>The idempotency token.</p>\"\
        },\
        \"IdentityManagementType\":{\
          \"shape\":\"DirectoryType\",\
          \"documentation\":\"<p>The type of identity management for your Amazon Connect users.</p>\"\
        },\
        \"InstanceAlias\":{\
          \"shape\":\"DirectoryAlias\",\
          \"documentation\":\"<p>The name for your instance.</p>\"\
        },\
        \"DirectoryId\":{\
          \"shape\":\"DirectoryId\",\
          \"documentation\":\"<p>The identifier for the directory.</p>\"\
        },\
        \"InboundCallsEnabled\":{\
          \"shape\":\"InboundCallsEnabled\",\
          \"documentation\":\"<p>Your contact center handles incoming contacts.</p>\"\
        },\
        \"OutboundCallsEnabled\":{\
          \"shape\":\"OutboundCallsEnabled\",\
          \"documentation\":\"<p>Your contact center allows outbound calls.</p>\"\
        }\
      }\
    },\
    \"CreateInstanceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier for the instance.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the instance.</p>\"\
        }\
      }\
    },\
    \"CreateIntegrationAssociationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"IntegrationType\",\
        \"IntegrationArn\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"IntegrationType\":{\
          \"shape\":\"IntegrationType\",\
          \"documentation\":\"<p>The type of information to be ingested.</p>\"\
        },\
        \"IntegrationArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the integration.</p> <note> <p>When integrating with Amazon Pinpoint, the Amazon Connect and Amazon Pinpoint instances must be in the same account.</p> </note>\"\
        },\
        \"SourceApplicationUrl\":{\
          \"shape\":\"URI\",\
          \"documentation\":\"<p>The URL for the external application. This field is only required for the EVENT integration type.</p>\"\
        },\
        \"SourceApplicationName\":{\
          \"shape\":\"SourceApplicationName\",\
          \"documentation\":\"<p>The name of the external application. This field is only required for the EVENT integration type.</p>\"\
        },\
        \"SourceType\":{\
          \"shape\":\"SourceType\",\
          \"documentation\":\"<p>The type of the data source. This field is only required for the EVENT integration type.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      }\
    },\
    \"CreateIntegrationAssociationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IntegrationAssociationId\":{\
          \"shape\":\"IntegrationAssociationId\",\
          \"documentation\":\"<p>The identifier for the integration association.</p>\"\
        },\
        \"IntegrationAssociationArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the association.</p>\"\
        }\
      }\
    },\
    \"CreateParticipantRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"ParticipantDetails\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance. </p>\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact in this instance of Amazon Connect. Only contacts in the CHAT channel are supported.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"ParticipantDetails\":{\
          \"shape\":\"ParticipantDetailsToAdd\",\
          \"documentation\":\"<p>Information identifying the participant.</p> <important> <p>The only Valid value for <code>ParticipantRole</code> is <code>CUSTOM_BOT</code>. </p> <p> <code>DisplayName</code> is <b>Required</b>.</p> </important>\"\
        }\
      }\
    },\
    \"CreateParticipantResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ParticipantCredentials\":{\
          \"shape\":\"ParticipantTokenCredentials\",\
          \"documentation\":\"<p>The token used by the chat participant to call <code>CreateParticipantConnection</code>. The participant token is valid for the lifetime of a chat participant.</p>\"\
        },\
        \"ParticipantId\":{\
          \"shape\":\"ParticipantId\",\
          \"documentation\":\"<p>The identifier for a chat participant. The participantId for a chat participant is the same throughout the chat lifecycle.</p>\"\
        }\
      }\
    },\
    \"CreatePromptRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\",\
        \"S3Uri\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"CommonNameLength127\",\
          \"documentation\":\"<p>The name of the prompt.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"PromptDescription\",\
          \"documentation\":\"<p>The description of the prompt.</p>\"\
        },\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The URI for the S3 bucket where the prompt is stored.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      }\
    },\
    \"CreatePromptResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PromptARN\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the prompt.</p>\"\
        },\
        \"PromptId\":{\
          \"shape\":\"PromptId\",\
          \"documentation\":\"<p>A unique identifier for the prompt.</p>\"\
        }\
      }\
    },\
    \"CreateQueueRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\",\
        \"HoursOfOperationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"CommonNameLength127\",\
          \"documentation\":\"<p>The name of the queue.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"QueueDescription\",\
          \"documentation\":\"<p>The description of the queue.</p>\"\
        },\
        \"OutboundCallerConfig\":{\
          \"shape\":\"OutboundCallerConfig\",\
          \"documentation\":\"<p>The outbound caller ID name, number, and outbound whisper flow.</p>\"\
        },\
        \"HoursOfOperationId\":{\
          \"shape\":\"HoursOfOperationId\",\
          \"documentation\":\"<p>The identifier for the hours of operation.</p>\"\
        },\
        \"MaxContacts\":{\
          \"shape\":\"QueueMaxContacts\",\
          \"documentation\":\"<p>The maximum number of contacts that can be in the queue before it is considered full.</p>\",\
          \"box\":true\
        },\
        \"QuickConnectIds\":{\
          \"shape\":\"QuickConnectsList\",\
          \"documentation\":\"<p>The quick connects available to agents who are working the queue.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      }\
    },\
    \"CreateQueueResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"QueueArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the queue.</p>\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\"\
        }\
      }\
    },\
    \"CreateQuickConnectRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\",\
        \"QuickConnectConfig\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"QuickConnectName\",\
          \"documentation\":\"<p>The name of the quick connect.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"QuickConnectDescription\",\
          \"documentation\":\"<p>The description of the quick connect.</p>\"\
        },\
        \"QuickConnectConfig\":{\
          \"shape\":\"QuickConnectConfig\",\
          \"documentation\":\"<p>Configuration settings for the quick connect.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      }\
    },\
    \"CreateQuickConnectResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"QuickConnectARN\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the quick connect. </p>\"\
        },\
        \"QuickConnectId\":{\
          \"shape\":\"QuickConnectId\",\
          \"documentation\":\"<p>The identifier for the quick connect. </p>\"\
        }\
      }\
    },\
    \"CreateRoutingProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\",\
        \"Description\",\
        \"DefaultOutboundQueueId\",\
        \"MediaConcurrencies\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"RoutingProfileName\",\
          \"documentation\":\"<p>The name of the routing profile. Must not be more than 127 characters.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"RoutingProfileDescription\",\
          \"documentation\":\"<p>Description of the routing profile. Must not be more than 250 characters.</p>\"\
        },\
        \"DefaultOutboundQueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The default outbound queue for the routing profile.</p>\"\
        },\
        \"QueueConfigs\":{\
          \"shape\":\"RoutingProfileQueueConfigList\",\
          \"documentation\":\"<p>The inbound queues associated with the routing profile. If no queue is added, the agent can make only outbound calls.</p> <p>The limit of 10 array members applies to the maximum number of <code>RoutingProfileQueueConfig</code> objects that can be passed during a CreateRoutingProfile API request. It is different from the quota of 50 queues per routing profile per instance that is listed in <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html\\\">Amazon Connect service quotas</a>. </p>\"\
        },\
        \"MediaConcurrencies\":{\
          \"shape\":\"MediaConcurrencies\",\
          \"documentation\":\"<p>The channels that agents can handle in the Contact Control Panel (CCP) for this routing profile.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        },\
        \"AgentAvailabilityTimer\":{\
          \"shape\":\"AgentAvailabilityTimer\",\
          \"documentation\":\"<p>Whether agents with this routing profile will have their routing order calculated based on <i>longest idle time</i> or <i>time since their last inbound contact</i>. </p>\"\
        }\
      }\
    },\
    \"CreateRoutingProfileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RoutingProfileArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the routing profile.</p>\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\"\
        }\
      }\
    },\
    \"CreateRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\",\
        \"TriggerEventSource\",\
        \"Function\",\
        \"Actions\",\
        \"PublishStatus\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"RuleName\",\
          \"documentation\":\"<p>A unique name for the rule.</p>\"\
        },\
        \"TriggerEventSource\":{\
          \"shape\":\"RuleTriggerEventSource\",\
          \"documentation\":\"<p>The event source to trigger the rule.</p>\"\
        },\
        \"Function\":{\
          \"shape\":\"RuleFunction\",\
          \"documentation\":\"<p>The conditions of the rule.</p>\"\
        },\
        \"Actions\":{\
          \"shape\":\"RuleActions\",\
          \"documentation\":\"<p>A list of actions to be run when the rule is triggered.</p>\"\
        },\
        \"PublishStatus\":{\
          \"shape\":\"RulePublishStatus\",\
          \"documentation\":\"<p>The publish status of the rule.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"CreateRuleResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RuleArn\",\
        \"RuleId\"\
      ],\
      \"members\":{\
        \"RuleArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the rule.</p>\"\
        },\
        \"RuleId\":{\
          \"shape\":\"RuleId\",\
          \"documentation\":\"<p>A unique identifier for the rule.</p>\"\
        }\
      }\
    },\
    \"CreateSecurityProfileName\":{\
      \"type\":\"string\",\
      \"max\":127,\
      \"min\":1,\
      \"pattern\":\"^[ a-zA-Z0-9_@-]+$\"\
    },\
    \"CreateSecurityProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SecurityProfileName\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"SecurityProfileName\":{\
          \"shape\":\"CreateSecurityProfileName\",\
          \"documentation\":\"<p>The name of the security profile.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"SecurityProfileDescription\",\
          \"documentation\":\"<p>The description of the security profile.</p>\"\
        },\
        \"Permissions\":{\
          \"shape\":\"PermissionsList\",\
          \"documentation\":\"<p>Permissions assigned to the security profile. For a list of valid permissions, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/security-profile-list.html\\\">List of security profile permissions</a>. </p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        },\
        \"AllowedAccessControlTags\":{\
          \"shape\":\"AllowedAccessControlTags\",\
          \"documentation\":\"<p>The list of tags that a security profile uses to restrict access to resources in Amazon Connect.</p>\"\
        },\
        \"TagRestrictedResources\":{\
          \"shape\":\"TagRestrictedResourceList\",\
          \"documentation\":\"<p>The list of resources that a security profile applies tag restrictions to in Amazon Connect. Following are acceptable ResourceNames: <code>User</code> | <code>SecurityProfile</code> | <code>Queue</code> | <code>RoutingProfile</code> </p>\"\
        }\
      }\
    },\
    \"CreateSecurityProfileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecurityProfileId\":{\
          \"shape\":\"SecurityProfileId\",\
          \"documentation\":\"<p>The identifier for the security profle.</p>\"\
        },\
        \"SecurityProfileArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the security profile.</p>\"\
        }\
      }\
    },\
    \"CreateTaskTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\",\
        \"Fields\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"TaskTemplateName\",\
          \"documentation\":\"<p>The name of the task template.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"TaskTemplateDescription\",\
          \"documentation\":\"<p>The description of the task template.</p>\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow that runs by default when a task is created by referencing this template.</p>\"\
        },\
        \"Constraints\":{\
          \"shape\":\"TaskTemplateConstraints\",\
          \"documentation\":\"<p>Constraints that are applicable to the fields listed.</p>\"\
        },\
        \"Defaults\":{\
          \"shape\":\"TaskTemplateDefaults\",\
          \"documentation\":\"<p>The default values for fields when a task is created by referencing this template.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"TaskTemplateStatus\",\
          \"documentation\":\"<p>Marks a template as <code>ACTIVE</code> or <code>INACTIVE</code> for a task to refer to it. Tasks can only be created from <code>ACTIVE</code> templates. If a template is marked as <code>INACTIVE</code>, then a task that refers to this template cannot be created. </p>\"\
        },\
        \"Fields\":{\
          \"shape\":\"TaskTemplateFields\",\
          \"documentation\":\"<p>Fields that are part of the template.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"CreateTaskTemplateResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Id\",\
        \"Arn\"\
      ],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TaskTemplateId\",\
          \"documentation\":\"<p>The identifier of the task template resource.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"TaskTemplateArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the task template resource.</p>\"\
        }\
      }\
    },\
    \"CreateTrafficDistributionGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"Name128\",\
          \"documentation\":\"<p>The name for the traffic distribution group. </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description250\",\
          \"documentation\":\"<p>A description for the traffic distribution group.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceIdOrArn\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance that has been replicated. You can find the <code>instanceId</code> in the ARN of the instance.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      }\
    },\
    \"CreateTrafficDistributionGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TrafficDistributionGroupId\",\
          \"documentation\":\"<p>The identifier of the traffic distribution group. This can be the ID or the ARN if the API is being called in the Region where the traffic distribution group was created. The ARN must be provided if the call is from the replicated Region.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"TrafficDistributionGroupArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the traffic distribution group.</p>\"\
        }\
      }\
    },\
    \"CreateUseCaseRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"IntegrationAssociationId\",\
        \"UseCaseType\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"IntegrationAssociationId\":{\
          \"shape\":\"IntegrationAssociationId\",\
          \"documentation\":\"<p>The identifier for the integration association.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IntegrationAssociationId\"\
        },\
        \"UseCaseType\":{\
          \"shape\":\"UseCaseType\",\
          \"documentation\":\"<p>The type of use case to associate to the integration association. Each integration association can have only one of each use case type.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      }\
    },\
    \"CreateUseCaseResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UseCaseId\":{\
          \"shape\":\"UseCaseId\",\
          \"documentation\":\"<p>The identifier of the use case.</p>\"\
        },\
        \"UseCaseArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the use case.</p>\"\
        }\
      }\
    },\
    \"CreateUserHierarchyGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"HierarchyGroupName\",\
          \"documentation\":\"<p>The name of the user hierarchy group. Must not be more than 100 characters.</p>\"\
        },\
        \"ParentGroupId\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier for the parent hierarchy group. The user hierarchy is created at level one if the parent group ID is null.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      }\
    },\
    \"CreateUserHierarchyGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HierarchyGroupId\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the hierarchy group.</p>\"\
        },\
        \"HierarchyGroupArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the hierarchy group. </p>\"\
        }\
      }\
    },\
    \"CreateUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Username\",\
        \"PhoneConfig\",\
        \"SecurityProfileIds\",\
        \"RoutingProfileId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"Username\":{\
          \"shape\":\"AgentUsername\",\
          \"documentation\":\"<p>The user name for the account. For instances not using SAML for identity management, the user name can include up to 20 characters. If you are using SAML for identity management, the user name can include up to 64 characters from [a-zA-Z0-9_-.\\\\@]+.</p>\"\
        },\
        \"Password\":{\
          \"shape\":\"Password\",\
          \"documentation\":\"<p>The password for the user account. A password is required if you are using Amazon Connect for identity management. Otherwise, it is an error to include a password.</p>\"\
        },\
        \"IdentityInfo\":{\
          \"shape\":\"UserIdentityInfo\",\
          \"documentation\":\"<p>The information about the identity of the user.</p>\"\
        },\
        \"PhoneConfig\":{\
          \"shape\":\"UserPhoneConfig\",\
          \"documentation\":\"<p>The phone settings for the user.</p>\"\
        },\
        \"DirectoryUserId\":{\
          \"shape\":\"DirectoryUserId\",\
          \"documentation\":\"<p>The identifier of the user account in the directory used for identity management. If Amazon Connect cannot access the directory, you can specify this identifier to authenticate users. If you include the identifier, we assume that Amazon Connect cannot access the directory. Otherwise, the identity information is used to authenticate users from your directory.</p> <p>This parameter is required if you are using an existing directory for identity management in Amazon Connect when Amazon Connect cannot access your directory to authenticate users. If you are using SAML for identity management and include this parameter, an error is returned.</p>\"\
        },\
        \"SecurityProfileIds\":{\
          \"shape\":\"SecurityProfileIds\",\
          \"documentation\":\"<p>The identifier of the security profile for the user.</p>\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile for the user.</p>\"\
        },\
        \"HierarchyGroupId\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the hierarchy group for the user.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      }\
    },\
    \"CreateUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\"\
        },\
        \"UserArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user account.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"VocabularyName\",\
        \"LanguageCode\",\
        \"Content\"\
      ],\
      \"members\":{\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>. If a create request is received more than once with same client token, subsequent requests return the previous response without creating a vocabulary again.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>A unique name of the custom vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"VocabularyLanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html\\\">What is Amazon Transcribe?</a> </p>\"\
        },\
        \"Content\":{\
          \"shape\":\"VocabularyContent\",\
          \"documentation\":\"<p>The content of the custom vocabulary in plain-text format with a table of values. Each row in the table represents a word or a phrase, described with <code>Phrase</code>, <code>IPA</code>, <code>SoundsLike</code>, and <code>DisplayAs</code> fields. Separate the fields with TAB characters. The size limit is 50KB. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html#create-vocabulary-table\\\">Create a custom vocabulary using a table</a>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyArn\",\
        \"VocabularyId\",\
        \"State\"\
      ],\
      \"members\":{\
        \"VocabularyArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the custom vocabulary.</p>\"\
        },\
        \"VocabularyId\":{\
          \"shape\":\"VocabularyId\",\
          \"documentation\":\"<p>The identifier of the custom vocabulary.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The current state of the custom vocabulary.</p>\"\
        }\
      }\
    },\
    \"Credentials\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"SecurityToken\",\
          \"documentation\":\"<p>An access token generated for a federated user to access Amazon Connect.</p>\"\
        },\
        \"AccessTokenExpiration\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>A token generated with an expiration time for the session a user is logged in to Amazon Connect.</p>\"\
        },\
        \"RefreshToken\":{\
          \"shape\":\"SecurityToken\",\
          \"documentation\":\"<p>Renews a token generated for a user to access the Amazon Connect instance.</p>\"\
        },\
        \"RefreshTokenExpiration\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>Renews the expiration timer for a generated token.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains credentials to use for federation.</p>\"\
    },\
    \"CrossChannelBehavior\":{\
      \"type\":\"structure\",\
      \"required\":[\"BehaviorType\"],\
      \"members\":{\
        \"BehaviorType\":{\
          \"shape\":\"BehaviorType\",\
          \"documentation\":\"<p>Specifies the other channels that can be routed to an agent handling their current channel.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Defines the cross-channel routing behavior that allows an agent working on a contact in one channel to be offered a contact from a different channel.</p>\"\
    },\
    \"CurrentMetric\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"CurrentMetricName\",\
          \"documentation\":\"<p>The name of the metric.</p>\"\
        },\
        \"Unit\":{\
          \"shape\":\"Unit\",\
          \"documentation\":\"<p>The unit for the metric.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a real-time metric. For a description of each metric, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html\\\">Real-time Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"CurrentMetricData\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Metric\":{\
          \"shape\":\"CurrentMetric\",\
          \"documentation\":\"<p>Information about the metric.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"Value\",\
          \"documentation\":\"<p>The value of the metric.</p>\",\
          \"box\":true\
        }\
      },\
      \"documentation\":\"<p>Contains the data for a real-time metric.</p>\"\
    },\
    \"CurrentMetricDataCollections\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CurrentMetricData\"}\
    },\
    \"CurrentMetricName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The current metric names.</p>\",\
      \"enum\":[\
        \"AGENTS_ONLINE\",\
        \"AGENTS_AVAILABLE\",\
        \"AGENTS_ON_CALL\",\
        \"AGENTS_NON_PRODUCTIVE\",\
        \"AGENTS_AFTER_CONTACT_WORK\",\
        \"AGENTS_ERROR\",\
        \"AGENTS_STAFFED\",\
        \"CONTACTS_IN_QUEUE\",\
        \"OLDEST_CONTACT_AGE\",\
        \"CONTACTS_SCHEDULED\",\
        \"AGENTS_ON_CONTACT\",\
        \"SLOTS_ACTIVE\",\
        \"SLOTS_AVAILABLE\"\
      ]\
    },\
    \"CurrentMetricResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Dimensions\":{\
          \"shape\":\"Dimensions\",\
          \"documentation\":\"<p>The dimensions for the metrics.</p>\"\
        },\
        \"Collections\":{\
          \"shape\":\"CurrentMetricDataCollections\",\
          \"documentation\":\"<p>The set of metrics.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a set of real-time metrics.</p>\"\
    },\
    \"CurrentMetricResults\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CurrentMetricResult\"}\
    },\
    \"CurrentMetricSortCriteria\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SortByMetric\":{\"shape\":\"CurrentMetricName\"},\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The way to sort.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The way to sort the resulting response based on metrics. By default resources are sorted based on <code>AGENTS_ONLINE</code>, <code>DESCENDING</code>. The metric collection is sorted based on the input metrics.</p>\"\
    },\
    \"CurrentMetricSortCriteriaMaxOne\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CurrentMetricSortCriteria\"},\
      \"max\":1,\
      \"min\":0\
    },\
    \"CurrentMetrics\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CurrentMetric\"}\
    },\
    \"DateReference\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ReferenceKey\",\
          \"documentation\":\"<p>Identifier of the date reference.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"ReferenceValue\",\
          \"documentation\":\"<p>A valid date.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a reference when the <code>referenceType</code> is <code>DATE</code>. Otherwise, null.</p>\"\
    },\
    \"DeactivateEvaluationFormRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"EvaluationFormId\",\
        \"EvaluationFormVersion\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"EvaluationFormId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The unique identifier for the evaluation form.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EvaluationFormId\"\
        },\
        \"EvaluationFormVersion\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>A version of the evaluation form. If the version property is not provided, the latest version of the evaluation form is deactivated.</p>\"\
        }\
      }\
    },\
    \"DeactivateEvaluationFormResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EvaluationFormId\",\
        \"EvaluationFormArn\",\
        \"EvaluationFormVersion\"\
      ],\
      \"members\":{\
        \"EvaluationFormId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The unique identifier for the evaluation form.</p>\"\
        },\
        \"EvaluationFormArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the evaluation form resource.</p>\"\
        },\
        \"EvaluationFormVersion\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>The version of the deactivated evaluation form resource.</p>\"\
        }\
      }\
    },\
    \"DefaultVocabulary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"LanguageCode\",\
        \"VocabularyId\",\
        \"VocabularyName\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"VocabularyLanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html\\\">What is Amazon Transcribe?</a> </p>\"\
        },\
        \"VocabularyId\":{\
          \"shape\":\"VocabularyId\",\
          \"documentation\":\"<p>The identifier of the custom vocabulary.</p>\"\
        },\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>A unique name of the custom vocabulary.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a default vocabulary.</p>\"\
    },\
    \"DefaultVocabularyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DefaultVocabulary\"}\
    },\
    \"Delay\":{\
      \"type\":\"integer\",\
      \"max\":9999,\
      \"min\":0\
    },\
    \"DeleteContactEvaluationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"EvaluationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"EvaluationId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>A unique identifier for the contact evaluation.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EvaluationId\"\
        }\
      }\
    },\
    \"DeleteContactFlowModuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowModuleId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowModuleId\":{\
          \"shape\":\"ContactFlowModuleId\",\
          \"documentation\":\"<p>The identifier of the flow module.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactFlowModuleId\"\
        }\
      }\
    },\
    \"DeleteContactFlowModuleResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteContactFlowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactFlowId\"\
        }\
      }\
    },\
    \"DeleteContactFlowResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteEvaluationFormRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"EvaluationFormId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"EvaluationFormId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The unique identifier for the evaluation form.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EvaluationFormId\"\
        },\
        \"EvaluationFormVersion\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>The unique identifier for the evaluation form.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"version\"\
        }\
      }\
    },\
    \"DeleteHoursOfOperationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"HoursOfOperationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"HoursOfOperationId\":{\
          \"shape\":\"HoursOfOperationId\",\
          \"documentation\":\"<p>The identifier for the hours of operation.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"HoursOfOperationId\"\
        }\
      }\
    },\
    \"DeleteInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"DeleteIntegrationAssociationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"IntegrationAssociationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"IntegrationAssociationId\":{\
          \"shape\":\"IntegrationAssociationId\",\
          \"documentation\":\"<p>The identifier for the integration association.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IntegrationAssociationId\"\
        }\
      }\
    },\
    \"DeletePromptRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"PromptId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"PromptId\":{\
          \"shape\":\"PromptId\",\
          \"documentation\":\"<p>A unique identifier for the prompt.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"PromptId\"\
        }\
      }\
    },\
    \"DeleteQueueRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        }\
      }\
    },\
    \"DeleteQuickConnectRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QuickConnectId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QuickConnectId\":{\
          \"shape\":\"QuickConnectId\",\
          \"documentation\":\"<p>The identifier for the quick connect.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QuickConnectId\"\
        }\
      }\
    },\
    \"DeleteRoutingProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RoutingProfileId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RoutingProfileId\"\
        }\
      }\
    },\
    \"DeleteRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RuleId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RuleId\":{\
          \"shape\":\"RuleId\",\
          \"documentation\":\"<p>A unique identifier for the rule.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RuleId\"\
        }\
      }\
    },\
    \"DeleteSecurityProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"SecurityProfileId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"SecurityProfileId\":{\
          \"shape\":\"SecurityProfileId\",\
          \"documentation\":\"<p>The identifier for the security profle.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"SecurityProfileId\"\
        }\
      }\
    },\
    \"DeleteTaskTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"TaskTemplateId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"TaskTemplateId\":{\
          \"shape\":\"TaskTemplateId\",\
          \"documentation\":\"<p>A unique identifier for the task template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TaskTemplateId\"\
        }\
      }\
    },\
    \"DeleteTaskTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteTrafficDistributionGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrafficDistributionGroupId\"],\
      \"members\":{\
        \"TrafficDistributionGroupId\":{\
          \"shape\":\"TrafficDistributionGroupIdOrArn\",\
          \"documentation\":\"<p>The identifier of the traffic distribution group. This can be the ID or the ARN if the API is being called in the Region where the traffic distribution group was created. The ARN must be provided if the call is from the replicated Region.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrafficDistributionGroupId\"\
        }\
      }\
    },\
    \"DeleteTrafficDistributionGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteUseCaseRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"IntegrationAssociationId\",\
        \"UseCaseId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"IntegrationAssociationId\":{\
          \"shape\":\"IntegrationAssociationId\",\
          \"documentation\":\"<p>The identifier for the integration association.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IntegrationAssociationId\"\
        },\
        \"UseCaseId\":{\
          \"shape\":\"UseCaseId\",\
          \"documentation\":\"<p>The identifier for the use case.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UseCaseId\"\
        }\
      }\
    },\
    \"DeleteUserHierarchyGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HierarchyGroupId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"HierarchyGroupId\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the hierarchy group.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"HierarchyGroupId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"DeleteUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"UserId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserId\"\
        }\
      }\
    },\
    \"DeleteVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"VocabularyId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"VocabularyId\":{\
          \"shape\":\"VocabularyId\",\
          \"documentation\":\"<p>The identifier of the custom vocabulary.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"VocabularyId\"\
        }\
      }\
    },\
    \"DeleteVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyArn\",\
        \"VocabularyId\",\
        \"State\"\
      ],\
      \"members\":{\
        \"VocabularyArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the custom vocabulary.</p>\"\
        },\
        \"VocabularyId\":{\
          \"shape\":\"VocabularyId\",\
          \"documentation\":\"<p>The identifier of the custom vocabulary.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The current state of the custom vocabulary.</p>\"\
        }\
      }\
    },\
    \"DescribeAgentStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"AgentStatusId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AgentStatusId\":{\
          \"shape\":\"AgentStatusId\",\
          \"documentation\":\"<p>The identifier for the agent status.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AgentStatusId\"\
        }\
      }\
    },\
    \"DescribeAgentStatusResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AgentStatus\":{\
          \"shape\":\"AgentStatus\",\
          \"documentation\":\"<p>The agent status.</p>\"\
        }\
      }\
    },\
    \"DescribeContactEvaluationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"EvaluationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"EvaluationId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>A unique identifier for the contact evaluation.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EvaluationId\"\
        }\
      }\
    },\
    \"DescribeContactEvaluationResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Evaluation\",\
        \"EvaluationForm\"\
      ],\
      \"members\":{\
        \"Evaluation\":{\
          \"shape\":\"Evaluation\",\
          \"documentation\":\"<p>Information about the evaluation form completed for a specific contact.</p>\"\
        },\
        \"EvaluationForm\":{\
          \"shape\":\"EvaluationFormContent\",\
          \"documentation\":\"<p>Information about the evaluation form.</p>\"\
        }\
      }\
    },\
    \"DescribeContactFlowModuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowModuleId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowModuleId\":{\
          \"shape\":\"ContactFlowModuleId\",\
          \"documentation\":\"<p>The identifier of the flow module.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactFlowModuleId\"\
        }\
      }\
    },\
    \"DescribeContactFlowModuleResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactFlowModule\":{\
          \"shape\":\"ContactFlowModule\",\
          \"documentation\":\"<p>Information about the flow module.</p>\"\
        }\
      }\
    },\
    \"DescribeContactFlowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactFlowId\"\
        }\
      }\
    },\
    \"DescribeContactFlowResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactFlow\":{\
          \"shape\":\"ContactFlow\",\
          \"documentation\":\"<p>Information about the flow.</p>\"\
        }\
      }\
    },\
    \"DescribeContactRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactId\"\
        }\
      }\
    },\
    \"DescribeContactResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Contact\":{\
          \"shape\":\"Contact\",\
          \"documentation\":\"<p>Information about the contact.</p>\"\
        }\
      }\
    },\
    \"DescribeEvaluationFormRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"EvaluationFormId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"EvaluationFormId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>A unique identifier for the contact evaluation.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EvaluationFormId\"\
        },\
        \"EvaluationFormVersion\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>A version of the evaluation form.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"version\"\
        }\
      }\
    },\
    \"DescribeEvaluationFormResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"EvaluationForm\"],\
      \"members\":{\
        \"EvaluationForm\":{\
          \"shape\":\"EvaluationForm\",\
          \"documentation\":\"<p>Information about the evaluation form.</p>\"\
        }\
      }\
    },\
    \"DescribeHoursOfOperationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"HoursOfOperationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"HoursOfOperationId\":{\
          \"shape\":\"HoursOfOperationId\",\
          \"documentation\":\"<p>The identifier for the hours of operation.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"HoursOfOperationId\"\
        }\
      }\
    },\
    \"DescribeHoursOfOperationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HoursOfOperation\":{\
          \"shape\":\"HoursOfOperation\",\
          \"documentation\":\"<p>The hours of operation.</p>\"\
        }\
      }\
    },\
    \"DescribeInstanceAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"AttributeType\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AttributeType\":{\
          \"shape\":\"InstanceAttributeType\",\
          \"documentation\":\"<p>The type of attribute.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AttributeType\"\
        }\
      }\
    },\
    \"DescribeInstanceAttributeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attribute\":{\
          \"shape\":\"Attribute\",\
          \"documentation\":\"<p>The type of attribute.</p>\"\
        }\
      }\
    },\
    \"DescribeInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"DescribeInstanceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Instance\":{\
          \"shape\":\"Instance\",\
          \"documentation\":\"<p>The name of the instance.</p>\"\
        }\
      }\
    },\
    \"DescribeInstanceStorageConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"AssociationId\",\
        \"ResourceType\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AssociationId\":{\
          \"shape\":\"AssociationId\",\
          \"documentation\":\"<p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AssociationId\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"InstanceStorageResourceType\",\
          \"documentation\":\"<p>A valid resource type.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resourceType\"\
        }\
      }\
    },\
    \"DescribeInstanceStorageConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StorageConfig\":{\
          \"shape\":\"InstanceStorageConfig\",\
          \"documentation\":\"<p>A valid storage type.</p>\"\
        }\
      }\
    },\
    \"DescribePhoneNumberRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"PhoneNumberId\"],\
      \"members\":{\
        \"PhoneNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>A unique identifier for the phone number.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"PhoneNumberId\"\
        }\
      }\
    },\
    \"DescribePhoneNumberResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ClaimedPhoneNumberSummary\":{\
          \"shape\":\"ClaimedPhoneNumberSummary\",\
          \"documentation\":\"<p>Information about a phone number that's been claimed to your Amazon Connect instance or traffic distribution group.</p>\"\
        }\
      }\
    },\
    \"DescribePromptRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"PromptId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"PromptId\":{\
          \"shape\":\"PromptId\",\
          \"documentation\":\"<p>A unique identifier for the prompt.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"PromptId\"\
        }\
      }\
    },\
    \"DescribePromptResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Prompt\":{\
          \"shape\":\"Prompt\",\
          \"documentation\":\"<p>Information about the prompt.</p>\"\
        }\
      }\
    },\
    \"DescribeQueueRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        }\
      }\
    },\
    \"DescribeQueueResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Queue\":{\
          \"shape\":\"Queue\",\
          \"documentation\":\"<p>The name of the queue.</p>\"\
        }\
      }\
    },\
    \"DescribeQuickConnectRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QuickConnectId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QuickConnectId\":{\
          \"shape\":\"QuickConnectId\",\
          \"documentation\":\"<p>The identifier for the quick connect.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QuickConnectId\"\
        }\
      }\
    },\
    \"DescribeQuickConnectResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"QuickConnect\":{\
          \"shape\":\"QuickConnect\",\
          \"documentation\":\"<p>Information about the quick connect.</p>\"\
        }\
      }\
    },\
    \"DescribeRoutingProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RoutingProfileId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RoutingProfileId\"\
        }\
      }\
    },\
    \"DescribeRoutingProfileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RoutingProfile\":{\
          \"shape\":\"RoutingProfile\",\
          \"documentation\":\"<p>The routing profile.</p>\"\
        }\
      }\
    },\
    \"DescribeRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RuleId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RuleId\":{\
          \"shape\":\"RuleId\",\
          \"documentation\":\"<p>A unique identifier for the rule.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RuleId\"\
        }\
      }\
    },\
    \"DescribeRuleResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Rule\"],\
      \"members\":{\
        \"Rule\":{\
          \"shape\":\"Rule\",\
          \"documentation\":\"<p>Information about the rule.</p>\"\
        }\
      }\
    },\
    \"DescribeSecurityProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SecurityProfileId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"SecurityProfileId\":{\
          \"shape\":\"SecurityProfileId\",\
          \"documentation\":\"<p>The identifier for the security profle.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"SecurityProfileId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"DescribeSecurityProfileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecurityProfile\":{\
          \"shape\":\"SecurityProfile\",\
          \"documentation\":\"<p>The security profile.</p>\"\
        }\
      }\
    },\
    \"DescribeTrafficDistributionGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrafficDistributionGroupId\"],\
      \"members\":{\
        \"TrafficDistributionGroupId\":{\
          \"shape\":\"TrafficDistributionGroupIdOrArn\",\
          \"documentation\":\"<p>The identifier of the traffic distribution group. This can be the ID or the ARN if the API is being called in the Region where the traffic distribution group was created. The ARN must be provided if the call is from the replicated Region.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrafficDistributionGroupId\"\
        }\
      }\
    },\
    \"DescribeTrafficDistributionGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrafficDistributionGroup\":{\
          \"shape\":\"TrafficDistributionGroup\",\
          \"documentation\":\"<p>Information about the traffic distribution group.</p>\"\
        }\
      }\
    },\
    \"DescribeUserHierarchyGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HierarchyGroupId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"HierarchyGroupId\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the hierarchy group.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"HierarchyGroupId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"DescribeUserHierarchyGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HierarchyGroup\":{\
          \"shape\":\"HierarchyGroup\",\
          \"documentation\":\"<p>Information about the hierarchy group.</p>\"\
        }\
      }\
    },\
    \"DescribeUserHierarchyStructureRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"DescribeUserHierarchyStructureResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HierarchyStructure\":{\
          \"shape\":\"HierarchyStructure\",\
          \"documentation\":\"<p>Information about the hierarchy structure.</p>\"\
        }\
      }\
    },\
    \"DescribeUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"DescribeUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"User\":{\
          \"shape\":\"User\",\
          \"documentation\":\"<p>Information about the user account and configuration settings.</p>\"\
        }\
      }\
    },\
    \"DescribeVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"VocabularyId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"VocabularyId\":{\
          \"shape\":\"VocabularyId\",\
          \"documentation\":\"<p>The identifier of the custom vocabulary.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"VocabularyId\"\
        }\
      }\
    },\
    \"DescribeVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Vocabulary\"],\
      \"members\":{\
        \"Vocabulary\":{\
          \"shape\":\"Vocabulary\",\
          \"documentation\":\"<p>A list of specific words that you want Contact Lens for Amazon Connect to recognize in your audio input. They are generally domain-specific words and phrases, words that Contact Lens is not recognizing, or proper nouns.</p>\"\
        }\
      }\
    },\
    \"Description\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":0\
    },\
    \"Description250\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":1,\
      \"pattern\":\"(^[\\\\S].*[\\\\S]$)|(^[\\\\S]$)\"\
    },\
    \"DestinationNotAllowedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The message about the outbound calls.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Outbound calls to the destination number are not allowed.</p>\",\
      \"error\":{\"httpStatusCode\":403},\
      \"exception\":true\
    },\
    \"Dimensions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Queue\":{\
          \"shape\":\"QueueReference\",\
          \"documentation\":\"<p>Information about the queue for which metrics are returned.</p>\"\
        },\
        \"Channel\":{\
          \"shape\":\"Channel\",\
          \"documentation\":\"<p>The channel used for grouping and filters.</p>\"\
        },\
        \"RoutingProfile\":{\"shape\":\"RoutingProfileReference\"}\
      },\
      \"documentation\":\"<p>Contains information about the dimensions for a set of metrics.</p>\"\
    },\
    \"DimensionsV2Key\":{\"type\":\"string\"},\
    \"DimensionsV2Map\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"DimensionsV2Key\"},\
      \"value\":{\"shape\":\"DimensionsV2Value\"}\
    },\
    \"DimensionsV2Value\":{\"type\":\"string\"},\
    \"DirectoryAlias\":{\
      \"type\":\"string\",\
      \"max\":45,\
      \"min\":1,\
      \"pattern\":\"^(?!d-)([\\\\da-zA-Z]+)([-]*[\\\\da-zA-Z])*$\",\
      \"sensitive\":true\
    },\
    \"DirectoryId\":{\
      \"type\":\"string\",\
      \"max\":12,\
      \"min\":12,\
      \"pattern\":\"^d-[0-9a-f]{10}$\"\
    },\
    \"DirectoryType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SAML\",\
        \"CONNECT_MANAGED\",\
        \"EXISTING_DIRECTORY\"\
      ]\
    },\
    \"DirectoryUserId\":{\"type\":\"string\"},\
    \"DisassociateApprovedOriginRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Origin\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Origin\":{\
          \"shape\":\"Origin\",\
          \"documentation\":\"<p>The domain URL of the integrated application.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"origin\"\
        }\
      }\
    },\
    \"DisassociateBotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"LexBot\":{\"shape\":\"LexBot\"},\
        \"LexV2Bot\":{\
          \"shape\":\"LexV2Bot\",\
          \"documentation\":\"<p>The Amazon Lex V2 bot to disassociate from the instance.</p>\"\
        }\
      }\
    },\
    \"DisassociateInstanceStorageConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"AssociationId\",\
        \"ResourceType\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AssociationId\":{\
          \"shape\":\"AssociationId\",\
          \"documentation\":\"<p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AssociationId\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"InstanceStorageResourceType\",\
          \"documentation\":\"<p>A valid resource type.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resourceType\"\
        }\
      }\
    },\
    \"DisassociateLambdaFunctionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"FunctionArn\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance..</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"FunctionArn\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Lambda function being disassociated.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"functionArn\"\
        }\
      }\
    },\
    \"DisassociateLexBotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"BotName\",\
        \"LexRegion\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"BotName\":{\
          \"shape\":\"BotName\",\
          \"documentation\":\"<p>The name of the Amazon Lex bot. Maximum character limit of 50.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"botName\"\
        },\
        \"LexRegion\":{\
          \"shape\":\"LexRegion\",\
          \"documentation\":\"<p>The Amazon Web Services Region in which the Amazon Lex bot has been created.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"lexRegion\"\
        }\
      }\
    },\
    \"DisassociatePhoneNumberContactFlowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PhoneNumberId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"PhoneNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>A unique identifier for the phone number.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"PhoneNumberId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"instanceId\"\
        }\
      }\
    },\
    \"DisassociateQueueQuickConnectsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\",\
        \"QuickConnectIds\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        },\
        \"QuickConnectIds\":{\
          \"shape\":\"QuickConnectsList\",\
          \"documentation\":\"<p>The quick connects to disassociate from the queue.</p>\"\
        }\
      }\
    },\
    \"DisassociateRoutingProfileQueuesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RoutingProfileId\",\
        \"QueueReferences\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RoutingProfileId\"\
        },\
        \"QueueReferences\":{\
          \"shape\":\"RoutingProfileQueueReferenceList\",\
          \"documentation\":\"<p>The queues to disassociate from this routing profile.</p>\"\
        }\
      }\
    },\
    \"DisassociateSecurityKeyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"AssociationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AssociationId\":{\
          \"shape\":\"AssociationId\",\
          \"documentation\":\"<p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AssociationId\"\
        }\
      }\
    },\
    \"DisassociateTrafficDistributionGroupUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrafficDistributionGroupId\",\
        \"UserId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"TrafficDistributionGroupId\":{\
          \"shape\":\"TrafficDistributionGroupIdOrArn\",\
          \"documentation\":\"<p>The identifier of the traffic distribution group. This can be the ID or the ARN if the API is being called in the Region where the traffic distribution group was created. The ARN must be provided if the call is from the replicated Region.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrafficDistributionGroupId\"\
        },\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier for the user. This can be the ID or the ARN of the user.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"UserId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"DisassociateTrafficDistributionGroupUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DismissUserContactRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserId\",\
        \"InstanceId\",\
        \"ContactId\"\
      ],\
      \"members\":{\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact.</p>\"\
        }\
      }\
    },\
    \"DismissUserContactResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DisplayName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"Distribution\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Region\",\
        \"Percentage\"\
      ],\
      \"members\":{\
        \"Region\":{\
          \"shape\":\"AwsRegion\",\
          \"documentation\":\"<p>The Amazon Web Services Region where the traffic is distributed.</p>\"\
        },\
        \"Percentage\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of the traffic that is distributed, in increments of 10.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a traffic distribution.</p>\"\
    },\
    \"DistributionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Distribution\"}\
    },\
    \"DuplicateResourceException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>A resource with the specified name already exists.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"Email\":{\"type\":\"string\"},\
    \"EmailReference\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ReferenceKey\",\
          \"documentation\":\"<p>Identifier of the email reference.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"ReferenceValue\",\
          \"documentation\":\"<p>A valid email address.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a reference when the <code>referenceType</code> is <code>EMAIL</code>. Otherwise, null.</p>\"\
    },\
    \"EncryptionConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EncryptionType\",\
        \"KeyId\"\
      ],\
      \"members\":{\
        \"EncryptionType\":{\
          \"shape\":\"EncryptionType\",\
          \"documentation\":\"<p>The type of encryption.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyId\",\
          \"documentation\":\"<p>The full ARN of the encryption key. </p> <note> <p>Be sure to provide the full ARN of the encryption key, not just the ID.</p> <p>Amazon Connect supports only KMS keys with the default key spec of <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/asymmetric-key-specs.html#key-spec-symmetric-default\\\"> <code>SYMMETRIC_DEFAULT</code> </a>. </p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The encryption configuration.</p>\"\
    },\
    \"EncryptionType\":{\
      \"type\":\"string\",\
      \"enum\":[\"KMS\"]\
    },\
    \"Evaluation\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EvaluationId\",\
        \"EvaluationArn\",\
        \"Metadata\",\
        \"Answers\",\
        \"Notes\",\
        \"Status\",\
        \"CreatedTime\",\
        \"LastModifiedTime\"\
      ],\
      \"members\":{\
        \"EvaluationId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>A unique identifier for the contact evaluation.</p>\"\
        },\
        \"EvaluationArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the contact evaluation resource.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"EvaluationMetadata\",\
          \"documentation\":\"<p>Metadata about the contact evaluation.</p>\"\
        },\
        \"Answers\":{\
          \"shape\":\"EvaluationAnswersOutputMap\",\
          \"documentation\":\"<p>A map of question identifiers to answer value.</p>\"\
        },\
        \"Notes\":{\
          \"shape\":\"EvaluationNotesMap\",\
          \"documentation\":\"<p>A map of question identifiers to note value.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"EvaluationStatus\",\
          \"documentation\":\"<p>The status of the contact evaluation.</p>\"\
        },\
        \"Scores\":{\
          \"shape\":\"EvaluationScoresMap\",\
          \"documentation\":\"<p>A map of item (section or question) identifiers to score value.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the evaluation was created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the evaluation was last updated.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a contact evaluation.</p>\"\
    },\
    \"EvaluationAnswerData\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StringValue\":{\
          \"shape\":\"EvaluationAnswerDataStringValue\",\
          \"documentation\":\"<p>The string value for an answer in a contact evaluation.</p>\"\
        },\
        \"NumericValue\":{\
          \"shape\":\"EvaluationAnswerDataNumericValue\",\
          \"documentation\":\"<p>The numeric value for an answer in a contact evaluation.</p>\"\
        },\
        \"NotApplicable\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>The flag to mark the question as not applicable.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about answer data for a contact evaluation. Answer data must be either string, numeric, or not applicable.</p>\",\
      \"union\":true\
    },\
    \"EvaluationAnswerDataNumericValue\":{\"type\":\"double\"},\
    \"EvaluationAnswerDataStringValue\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":0\
    },\
    \"EvaluationAnswerInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"EvaluationAnswerData\",\
          \"documentation\":\"<p>The value for an answer in a contact evaluation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about input answers for a contact evaluation.</p>\"\
    },\
    \"EvaluationAnswerOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"EvaluationAnswerData\",\
          \"documentation\":\"<p>The value for an answer in a contact evaluation.</p>\"\
        },\
        \"SystemSuggestedValue\":{\
          \"shape\":\"EvaluationAnswerData\",\
          \"documentation\":\"<p>The system suggested value for an answer in a contact evaluation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about output answers for a contact evaluation.</p>\"\
    },\
    \"EvaluationAnswersInputMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ResourceId\"},\
      \"value\":{\"shape\":\"EvaluationAnswerInput\"},\
      \"max\":100\
    },\
    \"EvaluationAnswersOutputMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ResourceId\"},\
      \"value\":{\"shape\":\"EvaluationAnswerOutput\"},\
      \"max\":100\
    },\
    \"EvaluationForm\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EvaluationFormId\",\
        \"EvaluationFormVersion\",\
        \"Locked\",\
        \"EvaluationFormArn\",\
        \"Title\",\
        \"Status\",\
        \"Items\",\
        \"CreatedTime\",\
        \"CreatedBy\",\
        \"LastModifiedTime\",\
        \"LastModifiedBy\"\
      ],\
      \"members\":{\
        \"EvaluationFormId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The unique identifier for the evaluation form.</p>\"\
        },\
        \"EvaluationFormVersion\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>A version of the evaluation form.</p>\"\
        },\
        \"Locked\":{\
          \"shape\":\"EvaluationFormVersionIsLocked\",\
          \"documentation\":\"<p>The flag indicating whether the evaluation form is locked for changes.</p>\"\
        },\
        \"EvaluationFormArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the evaluation form resource.</p>\"\
        },\
        \"Title\":{\
          \"shape\":\"EvaluationFormTitle\",\
          \"documentation\":\"<p>A title of the evaluation form.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"EvaluationFormDescription\",\
          \"documentation\":\"<p>The description of the evaluation form.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"EvaluationFormVersionStatus\",\
          \"documentation\":\"<p>The status of the evaluation form.</p>\"\
        },\
        \"Items\":{\
          \"shape\":\"EvaluationFormItemsList\",\
          \"documentation\":\"<p>Items that are part of the evaluation form. The total number of sections and questions must not exceed 100 each. Questions must be contained in a section.</p>\"\
        },\
        \"ScoringStrategy\":{\
          \"shape\":\"EvaluationFormScoringStrategy\",\
          \"documentation\":\"<p>A scoring strategy of the evaluation form.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the evaluation form was created.</p>\"\
        },\
        \"CreatedBy\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user who created the evaluation form.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the evaluation form was last updated.</p>\"\
        },\
        \"LastModifiedBy\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user who last updated the evaluation form.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the evaluation form.</p>\"\
    },\
    \"EvaluationFormContent\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EvaluationFormVersion\",\
        \"EvaluationFormId\",\
        \"EvaluationFormArn\",\
        \"Title\",\
        \"Items\"\
      ],\
      \"members\":{\
        \"EvaluationFormVersion\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>A version of the evaluation form.</p>\"\
        },\
        \"EvaluationFormId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The unique identifier for the evaluation form.</p>\"\
        },\
        \"EvaluationFormArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the evaluation form resource.</p>\"\
        },\
        \"Title\":{\
          \"shape\":\"EvaluationFormTitle\",\
          \"documentation\":\"<p>A title of the evaluation form.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"EvaluationFormDescription\",\
          \"documentation\":\"<p>The description of the evaluation form.</p>\"\
        },\
        \"Items\":{\
          \"shape\":\"EvaluationFormItemsList\",\
          \"documentation\":\"<p>Items that are part of the evaluation form. The total number of sections and questions must not exceed 100 each. Questions must be contained in a section.</p>\"\
        },\
        \"ScoringStrategy\":{\
          \"shape\":\"EvaluationFormScoringStrategy\",\
          \"documentation\":\"<p>A scoring strategy of the evaluation form.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an evaluation form used in a contact evaluation.</p>\"\
    },\
    \"EvaluationFormDescription\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0\
    },\
    \"EvaluationFormItem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Section\":{\
          \"shape\":\"EvaluationFormSection\",\
          \"documentation\":\"<p>The information of the section.</p>\"\
        },\
        \"Question\":{\
          \"shape\":\"EvaluationFormQuestion\",\
          \"documentation\":\"<p>The information of the question.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an item from an evaluation form. The item must be either a section or a question.</p>\",\
      \"union\":true\
    },\
    \"EvaluationFormItemWeight\":{\
      \"type\":\"double\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"EvaluationFormItemsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EvaluationFormItem\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"EvaluationFormNumericQuestionAutomation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PropertyValue\":{\
          \"shape\":\"NumericQuestionPropertyValueAutomation\",\
          \"documentation\":\"<p>The property value of the automation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the automation configuration in numeric questions.</p>\",\
      \"union\":true\
    },\
    \"EvaluationFormNumericQuestionOption\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MinValue\",\
        \"MaxValue\"\
      ],\
      \"members\":{\
        \"MinValue\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The minimum answer value of the range option.</p>\"\
        },\
        \"MaxValue\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum answer value of the range option.</p>\"\
        },\
        \"Score\":{\
          \"shape\":\"EvaluationFormQuestionAnswerScore\",\
          \"documentation\":\"<p>The score assigned to answer values within the range option.</p>\"\
        },\
        \"AutomaticFail\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>The flag to mark the option as automatic fail. If an automatic fail answer is provided, the overall evaluation gets a score of 0.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the option range used for scoring in numeric questions.</p>\"\
    },\
    \"EvaluationFormNumericQuestionOptionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EvaluationFormNumericQuestionOption\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"EvaluationFormNumericQuestionProperties\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MinValue\",\
        \"MaxValue\"\
      ],\
      \"members\":{\
        \"MinValue\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The minimum answer value.</p>\"\
        },\
        \"MaxValue\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum answer value.</p>\"\
        },\
        \"Options\":{\
          \"shape\":\"EvaluationFormNumericQuestionOptionList\",\
          \"documentation\":\"<p>The scoring options of the numeric question.</p>\"\
        },\
        \"Automation\":{\
          \"shape\":\"EvaluationFormNumericQuestionAutomation\",\
          \"documentation\":\"<p>The automation properties of the numeric question.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about properties for a numeric question in an evaluation form.</p>\"\
    },\
    \"EvaluationFormQuestion\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Title\",\
        \"RefId\",\
        \"QuestionType\"\
      ],\
      \"members\":{\
        \"Title\":{\
          \"shape\":\"EvaluationFormQuestionTitle\",\
          \"documentation\":\"<p>The title of the question.</p>\"\
        },\
        \"Instructions\":{\
          \"shape\":\"EvaluationFormQuestionInstructions\",\
          \"documentation\":\"<p>The instructions of the section.</p>\"\
        },\
        \"RefId\":{\
          \"shape\":\"ReferenceId\",\
          \"documentation\":\"<p>The identifier of the question. An identifier must be unique within the evaluation form.</p>\"\
        },\
        \"NotApplicableEnabled\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>The flag to enable not applicable answers to the question.</p>\"\
        },\
        \"QuestionType\":{\
          \"shape\":\"EvaluationFormQuestionType\",\
          \"documentation\":\"<p>The type of the question.</p>\"\
        },\
        \"QuestionTypeProperties\":{\
          \"shape\":\"EvaluationFormQuestionTypeProperties\",\
          \"documentation\":\"<p>The properties of the type of question. Text questions do not have to define question type properties.</p>\"\
        },\
        \"Weight\":{\
          \"shape\":\"EvaluationFormItemWeight\",\
          \"documentation\":\"<p>The scoring weight of the section.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a question from an evaluation form.</p>\"\
    },\
    \"EvaluationFormQuestionAnswerScore\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":0\
    },\
    \"EvaluationFormQuestionInstructions\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0\
    },\
    \"EvaluationFormQuestionTitle\":{\
      \"type\":\"string\",\
      \"max\":350,\
      \"min\":0\
    },\
    \"EvaluationFormQuestionType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TEXT\",\
        \"SINGLESELECT\",\
        \"NUMERIC\"\
      ]\
    },\
    \"EvaluationFormQuestionTypeProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Numeric\":{\
          \"shape\":\"EvaluationFormNumericQuestionProperties\",\
          \"documentation\":\"<p>The properties of the numeric question.</p>\"\
        },\
        \"SingleSelect\":{\
          \"shape\":\"EvaluationFormSingleSelectQuestionProperties\",\
          \"documentation\":\"<p>The properties of the numeric question.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about properties for a question in an evaluation form. The question type properties must be either for a numeric question or a single select question.</p>\",\
      \"union\":true\
    },\
    \"EvaluationFormScoringMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"QUESTION_ONLY\",\
        \"SECTION_ONLY\"\
      ]\
    },\
    \"EvaluationFormScoringStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENABLED\",\
        \"DISABLED\"\
      ]\
    },\
    \"EvaluationFormScoringStrategy\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Mode\",\
        \"Status\"\
      ],\
      \"members\":{\
        \"Mode\":{\
          \"shape\":\"EvaluationFormScoringMode\",\
          \"documentation\":\"<p>The scoring mode of the evaluation form.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"EvaluationFormScoringStatus\",\
          \"documentation\":\"<p>The scoring status of the evaluation form.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about scoring strategy for an evaluation form.</p>\"\
    },\
    \"EvaluationFormSection\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Title\",\
        \"RefId\",\
        \"Items\"\
      ],\
      \"members\":{\
        \"Title\":{\
          \"shape\":\"EvaluationFormSectionTitle\",\
          \"documentation\":\"<p>The title of the section.</p>\"\
        },\
        \"RefId\":{\
          \"shape\":\"ReferenceId\",\
          \"documentation\":\"<p>The identifier of the section. An identifier must be unique within the evaluation form.</p>\"\
        },\
        \"Instructions\":{\
          \"shape\":\"EvaluationFormQuestionInstructions\",\
          \"documentation\":\"<p>The instructions of the section.</p>\"\
        },\
        \"Items\":{\
          \"shape\":\"EvaluationFormItemsList\",\
          \"documentation\":\"<p>The items of the section.</p>\"\
        },\
        \"Weight\":{\
          \"shape\":\"EvaluationFormItemWeight\",\
          \"documentation\":\"<p>The scoring weight of the section.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a section from an evaluation form. A section can contain sections and/or questions. Evaluation forms can only contain sections and subsections (two level nesting).</p>\"\
    },\
    \"EvaluationFormSectionTitle\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":0\
    },\
    \"EvaluationFormSingleSelectQuestionAutomation\":{\
      \"type\":\"structure\",\
      \"required\":[\"Options\"],\
      \"members\":{\
        \"Options\":{\
          \"shape\":\"EvaluationFormSingleSelectQuestionAutomationOptionList\",\
          \"documentation\":\"<p>The automation options of the single select question.</p>\"\
        },\
        \"DefaultOptionRefId\":{\
          \"shape\":\"ReferenceId\",\
          \"documentation\":\"<p>The identifier of the default answer option, when none of the automation options match the criteria.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the automation configuration in single select questions. Automation options are evaluated in order, and the first matched option is applied. If no automation option matches, and there is a default option, then the default option is applied.</p>\"\
    },\
    \"EvaluationFormSingleSelectQuestionAutomationOption\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RuleCategory\":{\
          \"shape\":\"SingleSelectQuestionRuleCategoryAutomation\",\
          \"documentation\":\"<p>The automation option based on a rule category for the single select question.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the automation option of a single select question.</p>\",\
      \"union\":true\
    },\
    \"EvaluationFormSingleSelectQuestionAutomationOptionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EvaluationFormSingleSelectQuestionAutomationOption\"},\
      \"max\":20,\
      \"min\":1\
    },\
    \"EvaluationFormSingleSelectQuestionDisplayMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DROPDOWN\",\
        \"RADIO\"\
      ]\
    },\
    \"EvaluationFormSingleSelectQuestionOption\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RefId\",\
        \"Text\"\
      ],\
      \"members\":{\
        \"RefId\":{\
          \"shape\":\"ReferenceId\",\
          \"documentation\":\"<p>The identifier of the answer option. An identifier must be unique within the question.</p>\"\
        },\
        \"Text\":{\
          \"shape\":\"EvaluationFormSingleSelectQuestionOptionText\",\
          \"documentation\":\"<p>The title of the answer option.</p>\"\
        },\
        \"Score\":{\
          \"shape\":\"EvaluationFormQuestionAnswerScore\",\
          \"documentation\":\"<p>The score assigned to the answer option.</p>\"\
        },\
        \"AutomaticFail\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>The flag to mark the option as automatic fail. If an automatic fail answer is provided, the overall evaluation gets a score of 0.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the automation configuration in single select questions.</p>\"\
    },\
    \"EvaluationFormSingleSelectQuestionOptionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EvaluationFormSingleSelectQuestionOption\"},\
      \"max\":256,\
      \"min\":1\
    },\
    \"EvaluationFormSingleSelectQuestionOptionText\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":0\
    },\
    \"EvaluationFormSingleSelectQuestionProperties\":{\
      \"type\":\"structure\",\
      \"required\":[\"Options\"],\
      \"members\":{\
        \"Options\":{\
          \"shape\":\"EvaluationFormSingleSelectQuestionOptionList\",\
          \"documentation\":\"<p>The answer options of the single select question.</p>\"\
        },\
        \"DisplayAs\":{\
          \"shape\":\"EvaluationFormSingleSelectQuestionDisplayMode\",\
          \"documentation\":\"<p>The display mode of the single select question.</p>\"\
        },\
        \"Automation\":{\
          \"shape\":\"EvaluationFormSingleSelectQuestionAutomation\",\
          \"documentation\":\"<p>The display mode of the single select question.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the options in single select questions.</p>\"\
    },\
    \"EvaluationFormSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EvaluationFormId\",\
        \"EvaluationFormArn\",\
        \"Title\",\
        \"CreatedTime\",\
        \"CreatedBy\",\
        \"LastModifiedTime\",\
        \"LastModifiedBy\",\
        \"LatestVersion\"\
      ],\
      \"members\":{\
        \"EvaluationFormId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The unique identifier for the evaluation form.</p>\"\
        },\
        \"EvaluationFormArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the evaluation form resource.</p>\"\
        },\
        \"Title\":{\
          \"shape\":\"EvaluationFormTitle\",\
          \"documentation\":\"<p>A title of the evaluation form.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the evaluation form was created.</p>\"\
        },\
        \"CreatedBy\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user who created the evaluation form.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the evaluation form was last updated.</p>\"\
        },\
        \"LastModifiedBy\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user who last updated the evaluation form.</p>\"\
        },\
        \"LastActivatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the evaluation form was last activated.</p>\"\
        },\
        \"LastActivatedBy\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) of the user who last activated the evaluation form.</p>\"\
        },\
        \"LatestVersion\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>The version number of the latest evaluation form version.</p>\"\
        },\
        \"ActiveVersion\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>The version of the active evaluation form version.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary information about an evaluation form.</p>\"\
    },\
    \"EvaluationFormSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EvaluationFormSummary\"}\
    },\
    \"EvaluationFormTitle\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"EvaluationFormVersionIsLocked\":{\"type\":\"boolean\"},\
    \"EvaluationFormVersionStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DRAFT\",\
        \"ACTIVE\"\
      ]\
    },\
    \"EvaluationFormVersionSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EvaluationFormArn\",\
        \"EvaluationFormId\",\
        \"EvaluationFormVersion\",\
        \"Locked\",\
        \"Status\",\
        \"CreatedTime\",\
        \"CreatedBy\",\
        \"LastModifiedTime\",\
        \"LastModifiedBy\"\
      ],\
      \"members\":{\
        \"EvaluationFormArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the evaluation form resource.</p>\"\
        },\
        \"EvaluationFormId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The unique identifier for the evaluation form.</p>\"\
        },\
        \"EvaluationFormVersion\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>A version of the evaluation form.</p>\"\
        },\
        \"Locked\":{\
          \"shape\":\"EvaluationFormVersionIsLocked\",\
          \"documentation\":\"<p>The flag indicating whether the evaluation form is locked for changes.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"EvaluationFormVersionStatus\",\
          \"documentation\":\"<p>The status of the evaluation form.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the evaluation form was created.</p>\"\
        },\
        \"CreatedBy\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user who created the evaluation form.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the evaluation form was last updated.</p>\"\
        },\
        \"LastModifiedBy\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user who last updated the evaluation form.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary information about an evaluation form.</p>\"\
    },\
    \"EvaluationFormVersionSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EvaluationFormVersionSummary\"}\
    },\
    \"EvaluationMetadata\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ContactId\",\
        \"EvaluatorArn\"\
      ],\
      \"members\":{\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact in this instance of Amazon Connect. </p>\"\
        },\
        \"EvaluatorArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user who last updated the evaluation.</p>\"\
        },\
        \"ContactAgentId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The identifier of the agent who performed the contact.</p>\"\
        },\
        \"Score\":{\
          \"shape\":\"EvaluationScore\",\
          \"documentation\":\"<p>The overall score of the contact evaluation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Metadata information about a contact evaluation.</p>\"\
    },\
    \"EvaluationNote\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"EvaluationNoteString\",\
          \"documentation\":\"<p>The note for an item (section or question) in a contact evaluation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about notes for a contact evaluation.</p>\"\
    },\
    \"EvaluationNoteString\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0\
    },\
    \"EvaluationNotesMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ResourceId\"},\
      \"value\":{\"shape\":\"EvaluationNote\"},\
      \"max\":100\
    },\
    \"EvaluationScore\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Percentage\":{\
          \"shape\":\"EvaluationScorePercentage\",\
          \"documentation\":\"<p>The score percentage for an item in a contact evaluation.</p>\"\
        },\
        \"NotApplicable\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>The flag to mark the item as not applicable for scoring.</p>\"\
        },\
        \"AutomaticFail\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>The flag that marks the item as automatic fail. If the item or a child item gets an automatic fail answer, this flag will be true.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about scores of a contact evaluation item (section or question).</p>\"\
    },\
    \"EvaluationScorePercentage\":{\
      \"type\":\"double\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"EvaluationScoresMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ResourceId\"},\
      \"value\":{\"shape\":\"EvaluationScore\"},\
      \"max\":100\
    },\
    \"EvaluationStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DRAFT\",\
        \"SUBMITTED\"\
      ]\
    },\
    \"EvaluationSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EvaluationId\",\
        \"EvaluationArn\",\
        \"EvaluationFormTitle\",\
        \"EvaluationFormId\",\
        \"Status\",\
        \"EvaluatorArn\",\
        \"CreatedTime\",\
        \"LastModifiedTime\"\
      ],\
      \"members\":{\
        \"EvaluationId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>A unique identifier for the contact evaluation.</p>\"\
        },\
        \"EvaluationArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the contact evaluation resource.</p>\"\
        },\
        \"EvaluationFormTitle\":{\
          \"shape\":\"EvaluationFormTitle\",\
          \"documentation\":\"<p>A title of the evaluation form.</p>\"\
        },\
        \"EvaluationFormId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The unique identifier for the evaluation form.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"EvaluationStatus\",\
          \"documentation\":\"<p>The status of the contact evaluation.</p>\"\
        },\
        \"EvaluatorArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user who last updated the evaluation.</p>\"\
        },\
        \"Score\":{\
          \"shape\":\"EvaluationScore\",\
          \"documentation\":\"<p>The overall score of the contact evaluation.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the evaluation was created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the evaluation was last updated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary information about a contact evaluation.</p>\"\
    },\
    \"EvaluationSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EvaluationSummary\"}\
    },\
    \"EventBridgeActionDefinition\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"EventBridgeActionName\",\
          \"documentation\":\"<p>The name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The EventBridge action definition.</p>\"\
    },\
    \"EventBridgeActionName\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"EventSourceName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"OnPostCallAnalysisAvailable\",\
        \"OnRealTimeCallAnalysisAvailable\",\
        \"OnPostChatAnalysisAvailable\",\
        \"OnZendeskTicketCreate\",\
        \"OnZendeskTicketStatusUpdate\",\
        \"OnSalesforceCaseCreate\",\
        \"OnContactEvaluationSubmit\"\
      ]\
    },\
    \"FilterV2\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FilterKey\":{\
          \"shape\":\"ResourceArnOrId\",\
          \"documentation\":\"<p>The key to use for filtering data. For example, <code>QUEUE</code>, <code>ROUTING_PROFILE, AGENT</code>, <code>CHANNEL</code>, <code>AGENT_HIERARCHY_LEVEL_ONE</code>, <code>AGENT_HIERARCHY_LEVEL_TWO</code>, <code>AGENT_HIERARCHY_LEVEL_THREE</code>, <code>AGENT_HIERARCHY_LEVEL_FOUR</code>, <code>AGENT_HIERARCHY_LEVEL_FIVE</code>. There must be at least 1 key and a maximum 5 keys. </p>\"\
        },\
        \"FilterValues\":{\
          \"shape\":\"FilterValueList\",\
          \"documentation\":\"<p>The identifiers to use for filtering data. For example, if you have a filter key of <code>QUEUE</code>, you would add queue IDs or ARNs in <code>FilterValues</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the filter to apply when retrieving metrics with the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_GetMetricDataV2.html\\\">GetMetricDataV2</a> API.</p>\"\
    },\
    \"FilterValueList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceArnOrId\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"Filters\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Queues\":{\
          \"shape\":\"Queues\",\
          \"documentation\":\"<p>The queues to use to filter the metrics. You should specify at least one queue, and can specify up to 100 queues per request. The <code>GetCurrentMetricsData</code> API in particular requires a queue when you include a <code>Filter</code> in your request. </p>\"\
        },\
        \"Channels\":{\
          \"shape\":\"Channels\",\
          \"documentation\":\"<p>The channel to use to filter the metrics.</p>\"\
        },\
        \"RoutingProfiles\":{\
          \"shape\":\"RoutingProfiles\",\
          \"documentation\":\"<p>A list of up to 100 routing profile IDs or ARNs.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the filter to apply when retrieving metrics.</p>\"\
    },\
    \"FiltersV2List\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FilterV2\"},\
      \"max\":5,\
      \"min\":1\
    },\
    \"FunctionArn\":{\
      \"type\":\"string\",\
      \"max\":140,\
      \"min\":1\
    },\
    \"FunctionArnsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FunctionArn\"}\
    },\
    \"GetContactAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"InitialContactId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"InitialContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the initial contact.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InitialContactId\"\
        }\
      }\
    },\
    \"GetContactAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>Information about the attributes.</p>\"\
        }\
      }\
    },\
    \"GetCurrentMetricDataRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Filters\",\
        \"CurrentMetrics\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Filters\":{\
          \"shape\":\"Filters\",\
          \"documentation\":\"<p>The filters to apply to returned metrics. You can filter up to the following limits:</p> <ul> <li> <p>Queues: 100</p> </li> <li> <p>Routing profiles: 100</p> </li> <li> <p>Channels: 3 (VOICE, CHAT, and TASK channels are supported.)</p> </li> </ul> <p>Metric data is retrieved only for the resources associated with the queues or routing profiles, and by any channels included in the filter. (You cannot filter by both queue AND routing profile.) You can include both resource IDs and resource ARNs in the same request. </p> <p>Currently tagging is only supported on the resources that are passed in the filter.</p>\"\
        },\
        \"Groupings\":{\
          \"shape\":\"Groupings\",\
          \"documentation\":\"<p>The grouping applied to the metrics returned. For example, when grouped by <code>QUEUE</code>, the metrics returned apply to each queue rather than aggregated for all queues. </p> <ul> <li> <p>If you group by <code>CHANNEL</code>, you should include a Channels filter. VOICE, CHAT, and TASK channels are supported.</p> </li> <li> <p>If you group by <code>ROUTING_PROFILE</code>, you must include either a queue or routing profile filter. In addition, a routing profile filter is required for metrics <code>CONTACTS_SCHEDULED</code>, <code>CONTACTS_IN_QUEUE</code>, and <code> OLDEST_CONTACT_AGE</code>.</p> </li> <li> <p>If no <code>Grouping</code> is included in the request, a summary of metrics is returned.</p> </li> </ul>\"\
        },\
        \"CurrentMetrics\":{\
          \"shape\":\"CurrentMetrics\",\
          \"documentation\":\"<p>The metrics to retrieve. Specify the name and unit for each metric. The following metrics are available. For a description of all the metrics, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html\\\">Real-time Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p> <dl> <dt>AGENTS_AFTER_CONTACT_WORK</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#aftercallwork-real-time\\\">ACW</a> </p> </dd> <dt>AGENTS_AVAILABLE</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#available-real-time\\\">Available</a> </p> </dd> <dt>AGENTS_ERROR</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#error-real-time\\\">Error</a> </p> </dd> <dt>AGENTS_NON_PRODUCTIVE</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#non-productive-time-real-time\\\">NPT (Non-Productive Time)</a> </p> </dd> <dt>AGENTS_ON_CALL</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#on-call-real-time\\\">On contact</a> </p> </dd> <dt>AGENTS_ON_CONTACT</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#on-call-real-time\\\">On contact</a> </p> </dd> <dt>AGENTS_ONLINE</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#online-real-time\\\">Online</a> </p> </dd> <dt>AGENTS_STAFFED</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#staffed-real-time\\\">Staffed</a> </p> </dd> <dt>CONTACTS_IN_QUEUE</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#in-queue-real-time\\\">In queue</a> </p> </dd> <dt>CONTACTS_SCHEDULED</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#scheduled-real-time\\\">Scheduled</a> </p> </dd> <dt>OLDEST_CONTACT_AGE</dt> <dd> <p>Unit: SECONDS</p> <p>When you use groupings, Unit says SECONDS and the Value is returned in SECONDS. </p> <p>When you do not use groupings, Unit says SECONDS but the Value is returned in MILLISECONDS. For example, if you get a response like this:</p> <p> <code>{ \\\"Metric\\\": { \\\"Name\\\": \\\"OLDEST_CONTACT_AGE\\\", \\\"Unit\\\": \\\"SECONDS\\\" }, \\\"Value\\\": 24113.0 </code>}</p> <p>The actual OLDEST_CONTACT_AGE is 24 seconds.</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#oldest-real-time\\\">Oldest</a> </p> </dd> <dt>SLOTS_ACTIVE</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#active-real-time\\\">Active</a> </p> </dd> <dt>SLOTS_AVAILABLE</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#availability-real-time\\\">Availability</a> </p> </dd> </dl>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p> <p>The token expires after 5 minutes from the time it is created. Subsequent requests that use the token must use the same request parameters as the request that generated the token.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        },\
        \"SortCriteria\":{\
          \"shape\":\"CurrentMetricSortCriteriaMaxOne\",\
          \"documentation\":\"<p>The way to sort the resulting response based on metrics. You can enter one sort criteria. By default resources are sorted based on <code>AGENTS_ONLINE</code>, <code>DESCENDING</code>. The metric collection is sorted based on the input metrics.</p> <p>Note the following:</p> <ul> <li> <p>Sorting on <code>SLOTS_ACTIVE</code> and <code>SLOTS_AVAILABLE</code> is not supported.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"GetCurrentMetricDataResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p> <p>The token expires after 5 minutes from the time it is created. Subsequent requests that use the token must use the same request parameters as the request that generated the token.</p>\"\
        },\
        \"MetricResults\":{\
          \"shape\":\"CurrentMetricResults\",\
          \"documentation\":\"<p>Information about the real-time metrics.</p>\"\
        },\
        \"DataSnapshotTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The time at which the metrics were retrieved and cached for pagination.</p>\"\
        },\
        \"ApproximateTotalCount\":{\
          \"shape\":\"ApproximateTotalCount\",\
          \"documentation\":\"<p>The total count of the result, regardless of the current page size. </p>\"\
        }\
      }\
    },\
    \"GetCurrentUserDataRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Filters\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Filters\":{\
          \"shape\":\"UserDataFilters\",\
          \"documentation\":\"<p>The filters to apply to returned user data. You can filter up to the following limits:</p> <ul> <li> <p>Queues: 100</p> </li> <li> <p>Routing profiles: 100</p> </li> <li> <p>Agents: 100</p> </li> <li> <p>Contact states: 9</p> </li> <li> <p>User hierarchy groups: 1</p> </li> </ul> <p> The user data is retrieved for only the specified values/resources in the filter. A maximum of one filter can be passed from queues, routing profiles, agents, and user hierarchy groups. </p> <p>Currently tagging is only supported on the resources that are passed in the filter.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"GetCurrentUserDataResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"UserDataList\":{\
          \"shape\":\"UserDataList\",\
          \"documentation\":\"<p>A list of the user data that is returned.</p>\"\
        },\
        \"ApproximateTotalCount\":{\
          \"shape\":\"ApproximateTotalCount\",\
          \"documentation\":\"<p>The total count of the result, regardless of the current page size.</p>\"\
        }\
      }\
    },\
    \"GetFederationTokenRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"GetFederationTokenResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Credentials\":{\
          \"shape\":\"Credentials\",\
          \"documentation\":\"<p>The credentials to use for federation.</p>\"\
        },\
        \"SignInUrl\":{\
          \"shape\":\"Url\",\
          \"documentation\":\"<p>The URL to sign into the user's instance. </p>\"\
        },\
        \"UserArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user.</p>\"\
        },\
        \"UserId\":{\
          \"shape\":\"AgentResourceId\",\
          \"documentation\":\"<p>The identifier for the user. This can be the ID or the ARN of the user.</p>\"\
        }\
      }\
    },\
    \"GetMetricDataRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"StartTime\",\
        \"EndTime\",\
        \"Filters\",\
        \"HistoricalMetrics\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"StartTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp, in UNIX Epoch time format, at which to start the reporting interval for the retrieval of historical metrics data. The time must be specified using a multiple of 5 minutes, such as 10:05, 10:10, 10:15.</p> <p>The start time cannot be earlier than 24 hours before the time of the request. Historical metrics are available only for 24 hours.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp, in UNIX Epoch time format, at which to end the reporting interval for the retrieval of historical metrics data. The time must be specified using an interval of 5 minutes, such as 11:00, 11:05, 11:10, and must be later than the start time timestamp.</p> <p>The time range between the start and end time must be less than 24 hours.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"Filters\",\
          \"documentation\":\"<p>The queues, up to 100, or channels, to use to filter the metrics returned. Metric data is retrieved only for the resources associated with the queues or channels included in the filter. You can include both queue IDs and queue ARNs in the same request. VOICE, CHAT, and TASK channels are supported.</p> <note> <p>To filter by <code>Queues</code>, enter the queue ID/ARN, not the name of the queue.</p> </note>\"\
        },\
        \"Groupings\":{\
          \"shape\":\"Groupings\",\
          \"documentation\":\"<p>The grouping applied to the metrics returned. For example, when results are grouped by queue, the metrics returned are grouped by queue. The values returned apply to the metrics for each queue rather than aggregated for all queues.</p> <p>If no grouping is specified, a summary of metrics for all queues is returned.</p>\"\
        },\
        \"HistoricalMetrics\":{\
          \"shape\":\"HistoricalMetrics\",\
          \"documentation\":\"<p>The metrics to retrieve. Specify the name, unit, and statistic for each metric. The following historical metrics are available. For a description of each metric, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html\\\">Historical Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p> <note> <p>This API does not support a contacts incoming metric (there's no CONTACTS_INCOMING metric missing from the documented list). </p> </note> <dl> <dt>ABANDON_TIME</dt> <dd> <p>Unit: SECONDS</p> <p>Statistic: AVG</p> </dd> <dt>AFTER_CONTACT_WORK_TIME</dt> <dd> <p>Unit: SECONDS</p> <p>Statistic: AVG</p> </dd> <dt>API_CONTACTS_HANDLED</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CALLBACK_CONTACTS_HANDLED</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_ABANDONED</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_AGENT_HUNG_UP_FIRST</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_CONSULTED</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_HANDLED</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_HANDLED_INCOMING</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_HANDLED_OUTBOUND</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_HOLD_ABANDONS</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_MISSED</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_QUEUED</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_TRANSFERRED_IN</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_TRANSFERRED_IN_FROM_QUEUE</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_TRANSFERRED_OUT</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_TRANSFERRED_OUT_FROM_QUEUE</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>HANDLE_TIME</dt> <dd> <p>Unit: SECONDS</p> <p>Statistic: AVG</p> </dd> <dt>HOLD_TIME</dt> <dd> <p>Unit: SECONDS</p> <p>Statistic: AVG</p> </dd> <dt>INTERACTION_AND_HOLD_TIME</dt> <dd> <p>Unit: SECONDS</p> <p>Statistic: AVG</p> </dd> <dt>INTERACTION_TIME</dt> <dd> <p>Unit: SECONDS</p> <p>Statistic: AVG</p> </dd> <dt>OCCUPANCY</dt> <dd> <p>Unit: PERCENT</p> <p>Statistic: AVG</p> </dd> <dt>QUEUE_ANSWER_TIME</dt> <dd> <p>Unit: SECONDS</p> <p>Statistic: AVG</p> </dd> <dt>QUEUED_TIME</dt> <dd> <p>Unit: SECONDS</p> <p>Statistic: MAX</p> </dd> <dt>SERVICE_LEVEL</dt> <dd> <p>You can include up to 20 SERVICE_LEVEL metrics in a request.</p> <p>Unit: PERCENT</p> <p>Statistic: AVG</p> <p>Threshold: For <code>ThresholdValue</code>, enter any whole number from 1 to 604800 (inclusive), in seconds. For <code>Comparison</code>, you must enter <code>LT</code> (for \\\"Less than\\\"). </p> </dd> </dl>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"GetMetricDataResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p> <p>The token expires after 5 minutes from the time it is created. Subsequent requests that use the token must use the same request parameters as the request that generated the token.</p>\"\
        },\
        \"MetricResults\":{\
          \"shape\":\"HistoricalMetricResults\",\
          \"documentation\":\"<p>Information about the historical metrics.</p> <p>If no grouping is specified, a summary of metric data is returned.</p>\"\
        }\
      }\
    },\
    \"GetMetricDataV2Request\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"StartTime\",\
        \"EndTime\",\
        \"Filters\",\
        \"Metrics\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource. This includes the <code>instanceId</code> an Amazon Connect instance.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp, in UNIX Epoch time format, at which to start the reporting interval for the retrieval of historical metrics data. The time must be before the end time timestamp. The time range between the start and end time must be less than 24 hours. The start time cannot be earlier than 35 days before the time of the request. Historical metrics are available for 35 days.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp, in UNIX Epoch time format, at which to end the reporting interval for the retrieval of historical metrics data. The time must be later than the start time timestamp. It cannot be later than the current timestamp.</p> <p>The time range between the start and end time must be less than 24 hours.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"FiltersV2List\",\
          \"documentation\":\"<p>The filters to apply to returned metrics. You can filter on the following resources:</p> <ul> <li> <p>Queues</p> </li> <li> <p>Routing profiles</p> </li> <li> <p>Agents</p> </li> <li> <p>Channels</p> </li> <li> <p>User hierarchy groups</p> </li> <li> <p>Feature</p> </li> </ul> <p>At least one filter must be passed from queues, routing profiles, agents, or user hierarchy groups.</p> <p>To filter by phone number, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/create-historical-metrics-report.html\\\">Create a historical metrics report</a> in the <i>Amazon Connect Administrator's Guide</i>.</p> <p>Note the following limits:</p> <ul> <li> <p> <b>Filter keys</b>: A maximum of 5 filter keys are supported in a single request. Valid filter keys: <code>QUEUE</code> | <code>ROUTING_PROFILE</code> | <code>AGENT</code> | <code>CHANNEL</code> | <code>AGENT_HIERARCHY_LEVEL_ONE</code> | <code>AGENT_HIERARCHY_LEVEL_TWO</code> | <code>AGENT_HIERARCHY_LEVEL_THREE</code> | <code>AGENT_HIERARCHY_LEVEL_FOUR</code> | <code>AGENT_HIERARCHY_LEVEL_FIVE</code> | <code>FEATURE</code> </p> </li> <li> <p> <b>Filter values</b>: A maximum of 100 filter values are supported in a single request. VOICE, CHAT, and TASK are valid <code>filterValue</code> for the CHANNEL filter key. They do not count towards limitation of 100 filter values. For example, a GetMetricDataV2 request can filter by 50 queues, 35 agents, and 15 routing profiles for a total of 100 filter values, along with 3 channel filters. </p> <p> <code>contact_lens_conversational_analytics</code> is a valid filterValue for the <code>FEATURE</code> filter key. It is available only to contacts analyzed by Contact Lens conversational analytics.</p> </li> </ul>\"\
        },\
        \"Groupings\":{\
          \"shape\":\"GroupingsV2\",\
          \"documentation\":\"<p>The grouping applied to the metrics that are returned. For example, when results are grouped by queue, the metrics returned are grouped by queue. The values that are returned apply to the metrics for each queue. They are not aggregated for all queues.</p> <p>If no grouping is specified, a summary of all metrics is returned.</p> <p>Valid grouping keys: <code>QUEUE</code> | <code>ROUTING_PROFILE</code> | <code>AGENT</code> | <code>CHANNEL</code> | <code>AGENT_HIERARCHY_LEVEL_ONE</code> | <code>AGENT_HIERARCHY_LEVEL_TWO</code> | <code>AGENT_HIERARCHY_LEVEL_THREE</code> | <code>AGENT_HIERARCHY_LEVEL_FOUR</code> | <code>AGENT_HIERARCHY_LEVEL_FIVE</code> </p>\"\
        },\
        \"Metrics\":{\
          \"shape\":\"MetricsV2\",\
          \"documentation\":\"<p>The metrics to retrieve. Specify the name, groupings, and filters for each metric. The following historical metrics are available. For a description of each metric, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html\\\">Historical metrics definitions</a> in the <i>Amazon Connect Administrator's Guide</i>.</p> <dl> <dt>AGENT_ADHERENT_TIME</dt> <dd> <p>This metric is available only in Amazon Web Services Regions where <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/regions.html#optimization_region\\\">Forecasting, capacity planning, and scheduling</a> is available.</p> <p>Unit: Seconds</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy </p> </dd> <dt>AGENT_NON_RESPONSE</dt> <dd> <p>Unit: Count</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy </p> </dd> <dt>AGENT_OCCUPANCY</dt> <dd> <p>Unit: Percentage</p> <p>Valid groupings and filters: Routing Profile, Agent, Agent Hierarchy </p> </dd> <dt>AGENT_SCHEDULE_ADHERENCE</dt> <dd> <p>This metric is available only in Amazon Web Services Regions where <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/regions.html#optimization_region\\\">Forecasting, capacity planning, and scheduling</a> is available.</p> <p>Unit: Percent</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>AGENT_SCHEDULED_TIME</dt> <dd> <p>This metric is available only in Amazon Web Services Regions where <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/regions.html#optimization_region\\\">Forecasting, capacity planning, and scheduling</a> is available.</p> <p>Unit: Seconds</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>AVG_ABANDON_TIME</dt> <dd> <p>Unit: Seconds</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>AVG_AFTER_CONTACT_WORK_TIME</dt> <dd> <p>Unit: Seconds</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy, Feature</p> <note> <p>Feature is a valid filter but not a valid grouping.</p> </note> </dd> <dt>AVG_AGENT_CONNECTING_TIME</dt> <dd> <p>Unit: Seconds</p> <p>Valid metric filter key: <code>INITIATION_METHOD</code>. For now, this metric only supports the following as <code>INITIATION_METHOD</code>: <code>INBOUND</code> | <code>OUTBOUND</code> | <code>CALLBACK</code> | <code>API</code> </p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>AVG_AGENT_CONNECTING_TIME</dt> <dd> <p>Unit: Seconds</p> <p>Valid metric filter key: <code>INITIATION_METHOD</code>. For now, this metric only supports the following as <code>INITIATION_METHOD</code>: <code>INBOUND</code> | <code>OUTBOUND</code> | <code>CALLBACK</code> | <code>API</code> </p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>AVG_CONTACT_DURATION</dt> <dd> <p>Unit: Seconds</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy, Feature</p> <note> <p>Feature is a valid filter but not a valid grouping.</p> </note> </dd> <dt>AVG_CONVERSATION_DURATION</dt> <dd> <p>Unit: Seconds</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>AVG_GREETING_TIME_AGENT</dt> <dd> <p>This metric is available only for contacts analyzed by Contact Lens conversational analytics.</p> <p>Unit: Seconds</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>AVG_HANDLE_TIME</dt> <dd> <p>Unit: Seconds</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy, Feature</p> <note> <p>Feature is a valid filter but not a valid grouping.</p> </note> </dd> <dt>AVG_HOLD_TIME</dt> <dd> <p>Unit: Seconds</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy, Feature</p> <note> <p>Feature is a valid filter but not a valid grouping.</p> </note> </dd> <dt>AVG_HOLDS</dt> <dd> <p>Unit: Count</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy, Feature</p> <note> <p>Feature is a valid filter but not a valid grouping.</p> </note> </dd> <dt>AVG_INTERACTION_AND_HOLD_TIME</dt> <dd> <p>Unit: Seconds</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>AVG_INTERACTION_TIME</dt> <dd> <p>Unit: Seconds</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Feature</p> <note> <p>Feature is a valid filter but not a valid grouping.</p> </note> </dd> <dt>AVG_INTERRUPTIONS_AGENT</dt> <dd> <p>This metric is available only for contacts analyzed by Contact Lens conversational analytics.</p> <p>Unit: Count</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>AVG_INTERRUPTION_TIME_AGENT</dt> <dd> <p>This metric is available only for contacts analyzed by Contact Lens conversational analytics.</p> <p>Unit: Seconds</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>AVG_NON_TALK_TIME</dt> <dd> <p>This metric is available only for contacts analyzed by Contact Lens conversational analytics.</p> <p>Unit: Seconds</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>AVG_QUEUE_ANSWER_TIME</dt> <dd> <p>Unit: Seconds</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Feature</p> <note> <p>Feature is a valid filter but not a valid grouping.</p> </note> </dd> <dt>AVG_TALK_TIME</dt> <dd> <p>This metric is available only for contacts analyzed by Contact Lens conversational analytics.</p> <p>Unit: Seconds</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>AVG_TALK_TIME_AGENT</dt> <dd> <p>This metric is available only for contacts analyzed by Contact Lens conversational analytics.</p> <p>Unit: Seconds</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>AVG_TALK_TIME_CUSTOMER</dt> <dd> <p>This metric is available only for contacts analyzed by Contact Lens conversational analytics.</p> <p>Unit: Seconds</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>CONTACTS_ABANDONED</dt> <dd> <p>Unit: Count</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>CONTACTS_CREATED</dt> <dd> <p>Unit: Count</p> <p>Valid metric filter key: <code>INITIATION_METHOD</code> </p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Feature</p> <note> <p>Feature is a valid filter but not a valid grouping.</p> </note> </dd> <dt>CONTACTS_HANDLED</dt> <dd> <p>Unit: Count</p> <p>Valid metric filter key: <code>INITIATION_METHOD</code>, <code>DISCONNECT_REASON</code> </p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy, Feature</p> <note> <p>Feature is a valid filter but not a valid grouping.</p> </note> </dd> <dt>CONTACTS_HOLD_ABANDONS</dt> <dd> <p>Unit: Count</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>CONTACTS_QUEUED</dt> <dd> <p>Unit: Count</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>CONTACTS_TRANSFERRED_OUT</dt> <dd> <p>Unit: Count</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy, Feature</p> <note> <p>Feature is a valid filter but not a valid grouping.</p> </note> </dd> <dt>CONTACTS_TRANSFERRED_OUT_BY_AGENT</dt> <dd> <p>Unit: Count</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>CONTACTS_TRANSFERRED_OUT_FROM_QUEUE</dt> <dd> <p>Unit: Count</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>MAX_QUEUED_TIME</dt> <dd> <p>Unit: Seconds</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile, Agent, Agent Hierarchy</p> </dd> <dt>SERVICE_LEVEL</dt> <dd> <p>You can include up to 20 SERVICE_LEVEL metrics in a request.</p> <p>Unit: Percent</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile</p> <p>Threshold: For <code>ThresholdValue</code>, enter any whole number from 1 to 604800 (inclusive), in seconds. For <code>Comparison</code>, you must enter <code>LT</code> (for \\\"Less than\\\"). </p> </dd> <dt>SUM_CONTACTS_ANSWERED_IN_X</dt> <dd> <p>Unit: Count</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile</p> <p>Threshold: For <code>ThresholdValue</code>, enter any whole number from 1 to 604800 (inclusive), in seconds. For <code>Comparison</code>, you must enter <code>LT</code> (for \\\"Less than\\\"). </p> </dd> <dt>SUM_CONTACTS_ABANDONED_IN_X</dt> <dd> <p>Unit: Count</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile</p> <p>Threshold: For <code>ThresholdValue</code>, enter any whole number from 1 to 604800 (inclusive), in seconds. For <code>Comparison</code>, you must enter <code>LT</code> (for \\\"Less than\\\"). </p> </dd> <dt>SUM_CONTACTS_DISCONNECTED </dt> <dd> <p>Valid metric filter key: <code>DISCONNECT_REASON</code> </p> <p>Unit: Count</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile</p> </dd> <dt>SUM_RETRY_CALLBACK_ATTEMPTS</dt> <dd> <p>Unit: Count</p> <p>Valid groupings and filters: Queue, Channel, Routing Profile</p> </dd> </dl>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"GetMetricDataV2Response\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"MetricResults\":{\
          \"shape\":\"MetricResultsV2\",\
          \"documentation\":\"<p>Information about the metrics requested in the API request If no grouping is specified, a summary of metric data is returned. </p>\"\
        }\
      }\
    },\
    \"GetPromptFileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"PromptId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"PromptId\":{\
          \"shape\":\"PromptId\",\
          \"documentation\":\"<p>A unique identifier for the prompt.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"PromptId\"\
        }\
      }\
    },\
    \"GetPromptFileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PromptPresignedUrl\":{\
          \"shape\":\"PromptPresignedUrl\",\
          \"documentation\":\"<p>A generated URL to the prompt that can be given to an unauthorized user so they can access the prompt in S3.</p>\"\
        }\
      }\
    },\
    \"GetTaskTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"TaskTemplateId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"TaskTemplateId\":{\
          \"shape\":\"TaskTemplateId\",\
          \"documentation\":\"<p>A unique identifier for the task template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TaskTemplateId\"\
        },\
        \"SnapshotVersion\":{\
          \"shape\":\"SnapshotVersion\",\
          \"documentation\":\"<p>The system generated version of a task template that is associated with a task, when the task is created.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"snapshotVersion\"\
        }\
      }\
    },\
    \"GetTaskTemplateResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Id\",\
        \"Arn\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"TaskTemplateId\",\
          \"documentation\":\"<p>A unique identifier for the task template.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"TaskTemplateArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN).</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"TaskTemplateName\",\
          \"documentation\":\"<p>The name of the task template.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"TaskTemplateDescription\",\
          \"documentation\":\"<p>The description of the task template.</p>\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow that runs by default when a task is created by referencing this template.</p>\"\
        },\
        \"Constraints\":{\
          \"shape\":\"TaskTemplateConstraints\",\
          \"documentation\":\"<p>Constraints that are applicable to the fields listed.</p>\"\
        },\
        \"Defaults\":{\
          \"shape\":\"TaskTemplateDefaults\",\
          \"documentation\":\"<p>The default values for fields when a task is created by referencing this template.</p>\"\
        },\
        \"Fields\":{\
          \"shape\":\"TaskTemplateFields\",\
          \"documentation\":\"<p>Fields that are part of the template.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"TaskTemplateStatus\",\
          \"documentation\":\"<p>Marks a template as <code>ACTIVE</code> or <code>INACTIVE</code> for a task to refer to it. Tasks can only be created from <code>ACTIVE</code> templates. If a template is marked as <code>INACTIVE</code>, then a task that refers to this template cannot be created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp when the task template was last modified.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp when the task template was created.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      }\
    },\
    \"GetTrafficDistributionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TrafficDistributionGroupIdOrArn\",\
          \"documentation\":\"<p>The identifier of the traffic distribution group.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        }\
      }\
    },\
    \"GetTrafficDistributionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TelephonyConfig\":{\
          \"shape\":\"TelephonyConfig\",\
          \"documentation\":\"<p>The distribution of traffic between the instance and its replicas.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"TrafficDistributionGroupId\",\
          \"documentation\":\"<p>The identifier of the traffic distribution group. This can be the ID or the ARN if the API is being called in the Region where the traffic distribution group was created. The ARN must be provided if the call is from the replicated Region.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"TrafficDistributionGroupArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the traffic distribution group.</p>\"\
        },\
        \"SignInConfig\":{\
          \"shape\":\"SignInConfig\",\
          \"documentation\":\"<p>The distribution of allowing signing in to the instance and its replica(s).</p>\"\
        },\
        \"AgentConfig\":{\
          \"shape\":\"AgentConfig\",\
          \"documentation\":\"<p>The distribution of agents between the instance and its replica(s).</p>\"\
        }\
      }\
    },\
    \"Grouping\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"QUEUE\",\
        \"CHANNEL\",\
        \"ROUTING_PROFILE\"\
      ]\
    },\
    \"GroupingV2\":{\"type\":\"string\"},\
    \"Groupings\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Grouping\"},\
      \"max\":2\
    },\
    \"GroupingsV2\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"GroupingV2\"},\
      \"max\":2\
    },\
    \"HierarchyGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the hierarchy group.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the hierarchy group.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"HierarchyGroupName\",\
          \"documentation\":\"<p>The name of the hierarchy group.</p>\"\
        },\
        \"LevelId\":{\
          \"shape\":\"HierarchyLevelId\",\
          \"documentation\":\"<p>The identifier of the level in the hierarchy group.</p>\"\
        },\
        \"HierarchyPath\":{\
          \"shape\":\"HierarchyPath\",\
          \"documentation\":\"<p>Information about the levels in the hierarchy group.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a hierarchy group.</p>\"\
    },\
    \"HierarchyGroupCondition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The value in the hierarchy group condition.</p>\"\
        },\
        \"HierarchyGroupMatchType\":{\
          \"shape\":\"HierarchyGroupMatchType\",\
          \"documentation\":\"<p>The type of hierarchy group match.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A leaf node condition which can be used to specify a hierarchy group condition.</p>\"\
    },\
    \"HierarchyGroupId\":{\"type\":\"string\"},\
    \"HierarchyGroupMatchType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"EXACT\",\
        \"WITH_CHILD_GROUPS\"\
      ]\
    },\
    \"HierarchyGroupName\":{\"type\":\"string\"},\
    \"HierarchyGroupSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the hierarchy group.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the hierarchy group.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"HierarchyGroupName\",\
          \"documentation\":\"<p>The name of the hierarchy group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a hierarchy group.</p>\"\
    },\
    \"HierarchyGroupSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HierarchyGroupSummary\"}\
    },\
    \"HierarchyGroupSummaryReference\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The unique identifier for the hierarchy group.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the hierarchy group. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the hierarchy group.</p>\"\
    },\
    \"HierarchyLevel\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"HierarchyLevelId\",\
          \"documentation\":\"<p>The identifier of the hierarchy level.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the hierarchy level.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"HierarchyLevelName\",\
          \"documentation\":\"<p>The name of the hierarchy level.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a hierarchy level.</p>\"\
    },\
    \"HierarchyLevelId\":{\"type\":\"string\"},\
    \"HierarchyLevelName\":{\"type\":\"string\"},\
    \"HierarchyLevelUpdate\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"HierarchyLevelName\",\
          \"documentation\":\"<p>The name of the user hierarchy level. Must not be more than 50 characters.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the hierarchy level to update.</p>\"\
    },\
    \"HierarchyPath\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LevelOne\":{\
          \"shape\":\"HierarchyGroupSummary\",\
          \"documentation\":\"<p>Information about level one.</p>\"\
        },\
        \"LevelTwo\":{\
          \"shape\":\"HierarchyGroupSummary\",\
          \"documentation\":\"<p>Information about level two.</p>\"\
        },\
        \"LevelThree\":{\
          \"shape\":\"HierarchyGroupSummary\",\
          \"documentation\":\"<p>Information about level three.</p>\"\
        },\
        \"LevelFour\":{\
          \"shape\":\"HierarchyGroupSummary\",\
          \"documentation\":\"<p>Information about level four.</p>\"\
        },\
        \"LevelFive\":{\
          \"shape\":\"HierarchyGroupSummary\",\
          \"documentation\":\"<p>Information about level five.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the levels of a hierarchy group.</p>\"\
    },\
    \"HierarchyPathReference\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LevelOne\":{\
          \"shape\":\"HierarchyGroupSummaryReference\",\
          \"documentation\":\"<p>Information about level one.</p>\"\
        },\
        \"LevelTwo\":{\
          \"shape\":\"HierarchyGroupSummaryReference\",\
          \"documentation\":\"<p>Information about level two.</p>\"\
        },\
        \"LevelThree\":{\
          \"shape\":\"HierarchyGroupSummaryReference\",\
          \"documentation\":\"<p>Information about level three.</p>\"\
        },\
        \"LevelFour\":{\
          \"shape\":\"HierarchyGroupSummaryReference\",\
          \"documentation\":\"<p>Information about level four.</p>\"\
        },\
        \"LevelFive\":{\
          \"shape\":\"HierarchyGroupSummaryReference\",\
          \"documentation\":\"<p>Information about level five.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the levels in the hierarchy group.</p>\"\
    },\
    \"HierarchyStructure\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LevelOne\":{\
          \"shape\":\"HierarchyLevel\",\
          \"documentation\":\"<p>Information about level one.</p>\"\
        },\
        \"LevelTwo\":{\
          \"shape\":\"HierarchyLevel\",\
          \"documentation\":\"<p>Information about level two.</p>\"\
        },\
        \"LevelThree\":{\
          \"shape\":\"HierarchyLevel\",\
          \"documentation\":\"<p>Information about level three.</p>\"\
        },\
        \"LevelFour\":{\
          \"shape\":\"HierarchyLevel\",\
          \"documentation\":\"<p>Information about level four.</p>\"\
        },\
        \"LevelFive\":{\
          \"shape\":\"HierarchyLevel\",\
          \"documentation\":\"<p>Information about level five.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a hierarchy structure.</p>\"\
    },\
    \"HierarchyStructureUpdate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LevelOne\":{\
          \"shape\":\"HierarchyLevelUpdate\",\
          \"documentation\":\"<p>The update for level one.</p>\"\
        },\
        \"LevelTwo\":{\
          \"shape\":\"HierarchyLevelUpdate\",\
          \"documentation\":\"<p>The update for level two.</p>\"\
        },\
        \"LevelThree\":{\
          \"shape\":\"HierarchyLevelUpdate\",\
          \"documentation\":\"<p>The update for level three.</p>\"\
        },\
        \"LevelFour\":{\
          \"shape\":\"HierarchyLevelUpdate\",\
          \"documentation\":\"<p>The update for level four.</p>\"\
        },\
        \"LevelFive\":{\
          \"shape\":\"HierarchyLevelUpdate\",\
          \"documentation\":\"<p>The update for level five.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the level hierarchy to update.</p>\"\
    },\
    \"HistoricalMetric\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"HistoricalMetricName\",\
          \"documentation\":\"<p>The name of the metric.</p>\"\
        },\
        \"Threshold\":{\
          \"shape\":\"Threshold\",\
          \"documentation\":\"<p>The threshold for the metric, used with service level metrics.</p>\",\
          \"box\":true\
        },\
        \"Statistic\":{\
          \"shape\":\"Statistic\",\
          \"documentation\":\"<p>The statistic for the metric.</p>\"\
        },\
        \"Unit\":{\
          \"shape\":\"Unit\",\
          \"documentation\":\"<p>The unit for the metric.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a historical metric. For a description of each metric, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html\\\">Historical Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"HistoricalMetricData\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Metric\":{\
          \"shape\":\"HistoricalMetric\",\
          \"documentation\":\"<p>Information about the metric.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"Value\",\
          \"documentation\":\"<p>The value of the metric.</p>\",\
          \"box\":true\
        }\
      },\
      \"documentation\":\"<p>Contains the data for a historical metric.</p>\"\
    },\
    \"HistoricalMetricDataCollections\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HistoricalMetricData\"}\
    },\
    \"HistoricalMetricName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The historical metric names.</p>\",\
      \"enum\":[\
        \"CONTACTS_QUEUED\",\
        \"CONTACTS_HANDLED\",\
        \"CONTACTS_ABANDONED\",\
        \"CONTACTS_CONSULTED\",\
        \"CONTACTS_AGENT_HUNG_UP_FIRST\",\
        \"CONTACTS_HANDLED_INCOMING\",\
        \"CONTACTS_HANDLED_OUTBOUND\",\
        \"CONTACTS_HOLD_ABANDONS\",\
        \"CONTACTS_TRANSFERRED_IN\",\
        \"CONTACTS_TRANSFERRED_OUT\",\
        \"CONTACTS_TRANSFERRED_IN_FROM_QUEUE\",\
        \"CONTACTS_TRANSFERRED_OUT_FROM_QUEUE\",\
        \"CONTACTS_MISSED\",\
        \"CALLBACK_CONTACTS_HANDLED\",\
        \"API_CONTACTS_HANDLED\",\
        \"OCCUPANCY\",\
        \"HANDLE_TIME\",\
        \"AFTER_CONTACT_WORK_TIME\",\
        \"QUEUED_TIME\",\
        \"ABANDON_TIME\",\
        \"QUEUE_ANSWER_TIME\",\
        \"HOLD_TIME\",\
        \"INTERACTION_TIME\",\
        \"INTERACTION_AND_HOLD_TIME\",\
        \"SERVICE_LEVEL\"\
      ]\
    },\
    \"HistoricalMetricResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Dimensions\":{\
          \"shape\":\"Dimensions\",\
          \"documentation\":\"<p>The dimension for the metrics.</p>\"\
        },\
        \"Collections\":{\
          \"shape\":\"HistoricalMetricDataCollections\",\
          \"documentation\":\"<p>The set of metrics.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the historical metrics retrieved.</p>\"\
    },\
    \"HistoricalMetricResults\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HistoricalMetricResult\"}\
    },\
    \"HistoricalMetrics\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HistoricalMetric\"}\
    },\
    \"Hours\":{\
      \"type\":\"integer\",\
      \"max\":87600,\
      \"min\":0\
    },\
    \"Hours24Format\":{\
      \"type\":\"integer\",\
      \"max\":23,\
      \"min\":0\
    },\
    \"HoursOfOperation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HoursOfOperationId\":{\
          \"shape\":\"HoursOfOperationId\",\
          \"documentation\":\"<p>The identifier for the hours of operation.</p>\"\
        },\
        \"HoursOfOperationArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the hours of operation.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"CommonNameLength127\",\
          \"documentation\":\"<p>The name for the hours of operation.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"HoursOfOperationDescription\",\
          \"documentation\":\"<p>The description for the hours of operation.</p>\"\
        },\
        \"TimeZone\":{\
          \"shape\":\"TimeZone\",\
          \"documentation\":\"<p>The time zone for the hours of operation.</p>\"\
        },\
        \"Config\":{\
          \"shape\":\"HoursOfOperationConfigList\",\
          \"documentation\":\"<p>Configuration information for the hours of operation.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about of the hours of operation.</p>\"\
    },\
    \"HoursOfOperationConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Day\",\
        \"StartTime\",\
        \"EndTime\"\
      ],\
      \"members\":{\
        \"Day\":{\
          \"shape\":\"HoursOfOperationDays\",\
          \"documentation\":\"<p>The day that the hours of operation applies to.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"HoursOfOperationTimeSlice\",\
          \"documentation\":\"<p>The start time that your contact center opens.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"HoursOfOperationTimeSlice\",\
          \"documentation\":\"<p>The end time that your contact center closes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the hours of operation.</p>\"\
    },\
    \"HoursOfOperationConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HoursOfOperationConfig\"},\
      \"max\":100,\
      \"min\":0\
    },\
    \"HoursOfOperationDays\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SUNDAY\",\
        \"MONDAY\",\
        \"TUESDAY\",\
        \"WEDNESDAY\",\
        \"THURSDAY\",\
        \"FRIDAY\",\
        \"SATURDAY\"\
      ]\
    },\
    \"HoursOfOperationDescription\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":1\
    },\
    \"HoursOfOperationId\":{\"type\":\"string\"},\
    \"HoursOfOperationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HoursOfOperation\"}\
    },\
    \"HoursOfOperationName\":{\"type\":\"string\"},\
    \"HoursOfOperationSearchConditionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HoursOfOperationSearchCriteria\"}\
    },\
    \"HoursOfOperationSearchCriteria\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OrConditions\":{\
          \"shape\":\"HoursOfOperationSearchConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an OR condition.</p>\"\
        },\
        \"AndConditions\":{\
          \"shape\":\"HoursOfOperationSearchConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an AND condition.</p>\"\
        },\
        \"StringCondition\":{\
          \"shape\":\"StringCondition\",\
          \"documentation\":\"<p>A leaf node condition which can be used to specify a string condition.</p> <note> <p>The currently supported values for <code>FieldName</code> are <code>name</code>, <code>description</code>, <code>timezone</code>, and <code>resourceID</code>.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The search criteria to be used to return hours of operations.</p>\"\
    },\
    \"HoursOfOperationSearchFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TagFilter\":{\"shape\":\"ControlPlaneTagFilter\"}\
      },\
      \"documentation\":\"<p>Filters to be applied to search results.</p>\"\
    },\
    \"HoursOfOperationSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"HoursOfOperationId\",\
          \"documentation\":\"<p>The identifier of the hours of operation.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the hours of operation.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"HoursOfOperationName\",\
          \"documentation\":\"<p>The name of the hours of operation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about hours of operation for a contact center.</p>\"\
    },\
    \"HoursOfOperationSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HoursOfOperationSummary\"}\
    },\
    \"HoursOfOperationTimeSlice\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Hours\",\
        \"Minutes\"\
      ],\
      \"members\":{\
        \"Hours\":{\
          \"shape\":\"Hours24Format\",\
          \"documentation\":\"<p>The hours.</p>\",\
          \"box\":true\
        },\
        \"Minutes\":{\
          \"shape\":\"MinutesLimit60\",\
          \"documentation\":\"<p>The minutes.</p>\",\
          \"box\":true\
        }\
      },\
      \"documentation\":\"<p>The start time or end time for an hours of operation.</p>\"\
    },\
    \"ISO8601Datetime\":{\"type\":\"string\"},\
    \"IdempotencyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>An entity with the same name already exists.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"InboundCallsEnabled\":{\"type\":\"boolean\"},\
    \"Instance\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"IdentityManagementType\":{\
          \"shape\":\"DirectoryType\",\
          \"documentation\":\"<p>The identity management type.</p>\"\
        },\
        \"InstanceAlias\":{\
          \"shape\":\"DirectoryAlias\",\
          \"documentation\":\"<p>The alias of instance.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the instance was created.</p>\"\
        },\
        \"ServiceRole\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The service role of the instance.</p>\"\
        },\
        \"InstanceStatus\":{\
          \"shape\":\"InstanceStatus\",\
          \"documentation\":\"<p>The state of the instance.</p>\"\
        },\
        \"StatusReason\":{\
          \"shape\":\"InstanceStatusReason\",\
          \"documentation\":\"<p>Relevant details why the instance was not successfully created. </p>\"\
        },\
        \"InboundCallsEnabled\":{\
          \"shape\":\"InboundCallsEnabled\",\
          \"documentation\":\"<p>Whether inbound calls are enabled.</p>\"\
        },\
        \"OutboundCallsEnabled\":{\
          \"shape\":\"OutboundCallsEnabled\",\
          \"documentation\":\"<p>Whether outbound calls are enabled.</p>\"\
        },\
        \"InstanceAccessUrl\":{\
          \"shape\":\"Url\",\
          \"documentation\":\"<p>This URL allows contact center users to access the Amazon Connect admin website.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Amazon Connect instance.</p>\"\
    },\
    \"InstanceArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"arn:(aws|aws-us-gov):connect:[a-z]{2}-[a-z]+-[0-9-]{1}:[0-9]{1,20}:instance/[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}\"\
    },\
    \"InstanceAttributeType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INBOUND_CALLS\",\
        \"OUTBOUND_CALLS\",\
        \"CONTACTFLOW_LOGS\",\
        \"CONTACT_LENS\",\
        \"AUTO_RESOLVE_BEST_VOICES\",\
        \"USE_CUSTOM_TTS_VOICES\",\
        \"EARLY_MEDIA\",\
        \"MULTI_PARTY_CONFERENCE\",\
        \"HIGH_VOLUME_OUTBOUND\",\
        \"ENHANCED_CONTACT_MONITORING\"\
      ]\
    },\
    \"InstanceAttributeValue\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"InstanceId\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"InstanceIdOrArn\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":1,\
      \"pattern\":\"^(arn:(aws|aws-us-gov):connect:[a-z]{2}-[a-z]+-[0-9]{1}:[0-9]{1,20}:instance/)?[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$\"\
    },\
    \"InstanceStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATION_IN_PROGRESS\",\
        \"ACTIVE\",\
        \"CREATION_FAILED\"\
      ]\
    },\
    \"InstanceStatusReason\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Relevant details why the instance was not successfully created.</p>\"\
    },\
    \"InstanceStorageConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"StorageType\"],\
      \"members\":{\
        \"AssociationId\":{\
          \"shape\":\"AssociationId\",\
          \"documentation\":\"<p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>\"\
        },\
        \"StorageType\":{\
          \"shape\":\"StorageType\",\
          \"documentation\":\"<p>A valid storage type.</p>\"\
        },\
        \"S3Config\":{\
          \"shape\":\"S3Config\",\
          \"documentation\":\"<p>The S3 bucket configuration.</p>\"\
        },\
        \"KinesisVideoStreamConfig\":{\
          \"shape\":\"KinesisVideoStreamConfig\",\
          \"documentation\":\"<p>The configuration of the Kinesis video stream.</p>\"\
        },\
        \"KinesisStreamConfig\":{\
          \"shape\":\"KinesisStreamConfig\",\
          \"documentation\":\"<p>The configuration of the Kinesis data stream.</p>\"\
        },\
        \"KinesisFirehoseConfig\":{\
          \"shape\":\"KinesisFirehoseConfig\",\
          \"documentation\":\"<p>The configuration of the Kinesis Firehose delivery stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The storage configuration for the instance.</p>\"\
    },\
    \"InstanceStorageConfigs\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceStorageConfig\"}\
    },\
    \"InstanceStorageResourceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CHAT_TRANSCRIPTS\",\
        \"CALL_RECORDINGS\",\
        \"SCHEDULED_REPORTS\",\
        \"MEDIA_STREAMS\",\
        \"CONTACT_TRACE_RECORDS\",\
        \"AGENT_EVENTS\",\
        \"REAL_TIME_CONTACT_ANALYSIS_SEGMENTS\",\
        \"ATTACHMENTS\",\
        \"CONTACT_EVALUATIONS\",\
        \"SCREEN_RECORDINGS\"\
      ]\
    },\
    \"InstanceSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the instance.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"IdentityManagementType\":{\
          \"shape\":\"DirectoryType\",\
          \"documentation\":\"<p>The identity management type of the instance.</p>\"\
        },\
        \"InstanceAlias\":{\
          \"shape\":\"DirectoryAlias\",\
          \"documentation\":\"<p>The alias of the instance.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the instance was created.</p>\"\
        },\
        \"ServiceRole\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The service role of the instance.</p>\"\
        },\
        \"InstanceStatus\":{\
          \"shape\":\"InstanceStatus\",\
          \"documentation\":\"<p>The state of the instance.</p>\"\
        },\
        \"InboundCallsEnabled\":{\
          \"shape\":\"InboundCallsEnabled\",\
          \"documentation\":\"<p>Whether inbound calls are enabled.</p>\"\
        },\
        \"OutboundCallsEnabled\":{\
          \"shape\":\"OutboundCallsEnabled\",\
          \"documentation\":\"<p>Whether outbound calls are enabled.</p>\"\
        },\
        \"InstanceAccessUrl\":{\
          \"shape\":\"Url\",\
          \"documentation\":\"<p>This URL allows contact center users to access the Amazon Connect admin website.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the instance.</p>\"\
    },\
    \"InstanceSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceSummary\"}\
    },\
    \"Integer\":{\"type\":\"integer\"},\
    \"IntegerCount\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"IntegrationAssociationId\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1\
    },\
    \"IntegrationAssociationSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IntegrationAssociationId\":{\
          \"shape\":\"IntegrationAssociationId\",\
          \"documentation\":\"<p>The identifier for the AppIntegration association.</p>\"\
        },\
        \"IntegrationAssociationArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the AppIntegration association.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"IntegrationType\":{\
          \"shape\":\"IntegrationType\",\
          \"documentation\":\"<p>The integration type.</p>\"\
        },\
        \"IntegrationArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the AppIntegration.</p>\"\
        },\
        \"SourceApplicationUrl\":{\
          \"shape\":\"URI\",\
          \"documentation\":\"<p>The URL for the external application.</p>\"\
        },\
        \"SourceApplicationName\":{\
          \"shape\":\"SourceApplicationName\",\
          \"documentation\":\"<p>The user-provided, friendly name for the external application.</p>\"\
        },\
        \"SourceType\":{\
          \"shape\":\"SourceType\",\
          \"documentation\":\"<p>The name of the source.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about the associated AppIntegrations.</p>\"\
    },\
    \"IntegrationAssociationSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IntegrationAssociationSummary\"}\
    },\
    \"IntegrationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"EVENT\",\
        \"VOICE_ID\",\
        \"PINPOINT_APP\",\
        \"WISDOM_ASSISTANT\",\
        \"WISDOM_KNOWLEDGE_BASE\",\
        \"CASES_DOMAIN\"\
      ]\
    },\
    \"InternalServiceException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Request processing failed because of an error or failure with the service.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true\
    },\
    \"InvalidContactFlowException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"problems\":{\
          \"shape\":\"Problems\",\
          \"documentation\":\"<p>The problems with the flow. Please fix before trying again.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The flow is not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidContactFlowModuleException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Problems\":{\"shape\":\"Problems\"}\
      },\
      \"documentation\":\"<p>The problems with the module. Please fix before trying again.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidParameterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The message about the parameters.</p>\"\
        }\
      },\
      \"documentation\":\"<p>One or more of the specified parameters are not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The message about the request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request is not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvisibleFieldInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TaskTemplateFieldIdentifier\",\
          \"documentation\":\"<p>Identifier of the invisible field.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A field that is invisible to an agent.</p>\"\
    },\
    \"InvisibleTaskTemplateFields\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InvisibleFieldInfo\"}\
    },\
    \"KeyId\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"KinesisFirehoseConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"FirehoseArn\"],\
      \"members\":{\
        \"FirehoseArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the delivery stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information of a Kinesis Data Firehose delivery stream.</p>\"\
    },\
    \"KinesisStreamConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"StreamArn\"],\
      \"members\":{\
        \"StreamArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the data stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information of a Kinesis data stream.</p>\"\
    },\
    \"KinesisVideoStreamConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Prefix\",\
        \"RetentionPeriodHours\",\
        \"EncryptionConfig\"\
      ],\
      \"members\":{\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>The prefix of the video stream.</p>\"\
        },\
        \"RetentionPeriodHours\":{\
          \"shape\":\"Hours\",\
          \"documentation\":\"<p>The number of hours data is retained in the stream. Kinesis Video Streams retains the data in a data store that is associated with the stream.</p> <p>The default value is 0, indicating that the stream does not persist data.</p>\"\
        },\
        \"EncryptionConfig\":{\
          \"shape\":\"EncryptionConfig\",\
          \"documentation\":\"<p>The encryption configuration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information of a Kinesis video stream.</p>\"\
    },\
    \"LargeNextToken\":{\
      \"type\":\"string\",\
      \"max\":100000,\
      \"min\":1\
    },\
    \"LexBot\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"LexRegion\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"BotName\",\
          \"documentation\":\"<p>The name of the Amazon Lex bot.</p>\"\
        },\
        \"LexRegion\":{\
          \"shape\":\"LexRegion\",\
          \"documentation\":\"<p>The Amazon Web Services Region where the Amazon Lex bot was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information of an Amazon Lex bot.</p>\"\
    },\
    \"LexBotConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LexBot\":{\"shape\":\"LexBot\"},\
        \"LexV2Bot\":{\
          \"shape\":\"LexV2Bot\",\
          \"documentation\":\"<p>Configuration information of an Amazon Lex V2 bot.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information of an Amazon Lex or Amazon Lex V2 bot.</p>\"\
    },\
    \"LexBotConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LexBotConfig\"}\
    },\
    \"LexBotsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LexBot\"}\
    },\
    \"LexRegion\":{\
      \"type\":\"string\",\
      \"max\":60\
    },\
    \"LexV2Bot\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AliasArn\":{\
          \"shape\":\"AliasArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Lex V2 bot.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information of an Amazon Lex V2 bot.</p>\"\
    },\
    \"LexVersion\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"V1\",\
        \"V2\"\
      ]\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The message about the limit.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The allowed limit for the resource has been exceeded.</p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"ListAgentStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"AgentStatusTypes\":{\
          \"shape\":\"AgentStatusTypes\",\
          \"documentation\":\"<p>Available agent status types.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"AgentStatusTypes\"\
        }\
      }\
    },\
    \"ListAgentStatusResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"AgentStatusSummaryList\":{\
          \"shape\":\"AgentStatusSummaryList\",\
          \"documentation\":\"<p>A summary of agent statuses.</p>\"\
        }\
      }\
    },\
    \"ListApprovedOriginsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult25\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListApprovedOriginsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Origins\":{\
          \"shape\":\"OriginsList\",\
          \"documentation\":\"<p>The approved origins.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListBotsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"LexVersion\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult25\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"LexVersion\":{\
          \"shape\":\"LexVersion\",\
          \"documentation\":\"<p>The version of Amazon Lex or Amazon Lex V2.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"lexVersion\"\
        }\
      }\
    },\
    \"ListBotsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LexBots\":{\
          \"shape\":\"LexBotConfigList\",\
          \"documentation\":\"<p>The names and Amazon Web Services Regions of the Amazon Lex or Amazon Lex V2 bots associated with the specified instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListContactEvaluationsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact in this instance of Amazon Connect. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"contactId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p> <important> <p>This is not expected to be set because the value returned in the previous response is always null.</p> </important>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"ListContactEvaluationsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"EvaluationSummaryList\"],\
      \"members\":{\
        \"EvaluationSummaryList\":{\
          \"shape\":\"EvaluationSummaryList\",\
          \"documentation\":\"<p>Provides details about a list of contact evaluations belonging to an instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p> <important> <p>This is always returned as null in the response.</p> </important>\"\
        }\
      }\
    },\
    \"ListContactFlowModulesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"ContactFlowModuleState\":{\
          \"shape\":\"ContactFlowModuleState\",\
          \"documentation\":\"<p>The state of the flow module.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"state\"\
        }\
      }\
    },\
    \"ListContactFlowModulesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactFlowModulesSummaryList\":{\
          \"shape\":\"ContactFlowModulesSummaryList\",\
          \"documentation\":\"<p>Information about the flow module.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListContactFlowsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowTypes\":{\
          \"shape\":\"ContactFlowTypes\",\
          \"documentation\":\"<p>The type of flow.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"contactFlowTypes\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page. The default MaxResult size is 100.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListContactFlowsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactFlowSummaryList\":{\
          \"shape\":\"ContactFlowSummaryList\",\
          \"documentation\":\"<p>Information about the flows.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListContactReferencesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"ReferenceTypes\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the initial contact.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactId\"\
        },\
        \"ReferenceTypes\":{\
          \"shape\":\"ReferenceTypes\",\
          \"documentation\":\"<p>The type of reference.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"referenceTypes\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p> <important> <p>This is not expected to be set, because the value returned in the previous response is always null.</p> </important>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"ListContactReferencesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReferenceSummaryList\":{\
          \"shape\":\"ReferenceSummaryList\",\
          \"documentation\":\"<p>Information about the flows.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p> <important> <p>This is always returned as null in the response.</p> </important>\"\
        }\
      }\
    },\
    \"ListDefaultVocabulariesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"VocabularyLanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html\\\">What is Amazon Transcribe?</a> </p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"VocabularyNextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListDefaultVocabulariesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"DefaultVocabularyList\"],\
      \"members\":{\
        \"DefaultVocabularyList\":{\
          \"shape\":\"DefaultVocabularyList\",\
          \"documentation\":\"<p>A list of default vocabularies.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"VocabularyNextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListEvaluationFormVersionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"EvaluationFormId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"EvaluationFormId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The unique identifier for the evaluation form.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EvaluationFormId\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"ListEvaluationFormVersionsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"EvaluationFormVersionSummaryList\"],\
      \"members\":{\
        \"EvaluationFormVersionSummaryList\":{\
          \"shape\":\"EvaluationFormVersionSummaryList\",\
          \"documentation\":\"<p>Provides details about a list of evaluation forms belonging to an instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListEvaluationFormsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"ListEvaluationFormsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"EvaluationFormSummaryList\"],\
      \"members\":{\
        \"EvaluationFormSummaryList\":{\
          \"shape\":\"EvaluationFormSummaryList\",\
          \"documentation\":\"<p>Provides details about a list of evaluation forms belonging to an instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListHoursOfOperationsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page. The default MaxResult size is 100.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListHoursOfOperationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HoursOfOperationSummaryList\":{\
          \"shape\":\"HoursOfOperationSummaryList\",\
          \"documentation\":\"<p>Information about the hours of operation.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListInstanceAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult7\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListInstanceAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attributes\":{\
          \"shape\":\"AttributesList\",\
          \"documentation\":\"<p>The attribute types.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListInstanceStorageConfigsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ResourceType\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"InstanceStorageResourceType\",\
          \"documentation\":\"<p>A valid resource type.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resourceType\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult10\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListInstanceStorageConfigsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StorageConfigs\":{\
          \"shape\":\"InstanceStorageConfigs\",\
          \"documentation\":\"<p>A valid storage type.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListInstancesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult10\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListInstancesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceSummaryList\":{\
          \"shape\":\"InstanceSummaryList\",\
          \"documentation\":\"<p>Information about the instances.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListIntegrationAssociationsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"IntegrationType\":{\
          \"shape\":\"IntegrationType\",\
          \"documentation\":\"<p>The integration type.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"integrationType\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListIntegrationAssociationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IntegrationAssociationSummaryList\":{\
          \"shape\":\"IntegrationAssociationSummaryList\",\
          \"documentation\":\"<p>The associations.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListLambdaFunctionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult25\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListLambdaFunctionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LambdaFunctions\":{\
          \"shape\":\"FunctionArnsList\",\
          \"documentation\":\"<p>The Lambdafunction ARNs associated with the specified instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListLexBotsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult25\",\
          \"documentation\":\"<p>The maximum number of results to return per page. If no value is specified, the default is 10. </p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListLexBotsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LexBots\":{\
          \"shape\":\"LexBotsList\",\
          \"documentation\":\"<p>The names and Amazon Web Services Regions of the Amazon Lex bots associated with the specified instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListPhoneNumbersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"PhoneNumberTypes\":{\
          \"shape\":\"PhoneNumberTypes\",\
          \"documentation\":\"<p>The type of phone number.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"phoneNumberTypes\"\
        },\
        \"PhoneNumberCountryCodes\":{\
          \"shape\":\"PhoneNumberCountryCodes\",\
          \"documentation\":\"<p>The ISO country code.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"phoneNumberCountryCodes\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page. The default MaxResult size is 100.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListPhoneNumbersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PhoneNumberSummaryList\":{\
          \"shape\":\"PhoneNumberSummaryList\",\
          \"documentation\":\"<p>Information about the phone numbers.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListPhoneNumbersSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PhoneNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>A unique identifier for the phone number.</p>\"\
        },\
        \"PhoneNumberArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the phone number.</p>\"\
        },\
        \"PhoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number. Phone numbers are formatted <code>[+] [country code] [subscriber number including area code]</code>.</p>\"\
        },\
        \"PhoneNumberCountryCode\":{\
          \"shape\":\"PhoneNumberCountryCode\",\
          \"documentation\":\"<p>The ISO country code.</p>\"\
        },\
        \"PhoneNumberType\":{\
          \"shape\":\"PhoneNumberType\",\
          \"documentation\":\"<p>The type of phone number.</p>\"\
        },\
        \"TargetArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for Amazon Connect instances or traffic distribution groups that phone numbers are claimed to.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about phone numbers that have been claimed to your Amazon Connect instance or traffic distribution group.</p>\"\
    },\
    \"ListPhoneNumbersSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ListPhoneNumbersSummary\"}\
    },\
    \"ListPhoneNumbersV2Request\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TargetArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for Amazon Connect instances or traffic distribution groups that phone numbers are claimed to. If <code>TargetArn</code> input is not provided, this API lists numbers claimed to all the Amazon Connect instances belonging to your account in the same Amazon Web Services Region as the request.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        },\
        \"NextToken\":{\
          \"shape\":\"LargeNextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        },\
        \"PhoneNumberCountryCodes\":{\
          \"shape\":\"PhoneNumberCountryCodes\",\
          \"documentation\":\"<p>The ISO country code.</p>\"\
        },\
        \"PhoneNumberTypes\":{\
          \"shape\":\"PhoneNumberTypes\",\
          \"documentation\":\"<p>The type of phone number.</p>\"\
        },\
        \"PhoneNumberPrefix\":{\
          \"shape\":\"PhoneNumberPrefix\",\
          \"documentation\":\"<p>The prefix of the phone number. If provided, it must contain <code>+</code> as part of the country code.</p>\"\
        }\
      }\
    },\
    \"ListPhoneNumbersV2Response\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"LargeNextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"ListPhoneNumbersSummaryList\":{\
          \"shape\":\"ListPhoneNumbersSummaryList\",\
          \"documentation\":\"<p>Information about phone numbers that have been claimed to your Amazon Connect instances or traffic distribution groups.</p>\"\
        }\
      }\
    },\
    \"ListPromptsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page. The default MaxResult size is 100.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListPromptsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PromptSummaryList\":{\
          \"shape\":\"PromptSummaryList\",\
          \"documentation\":\"<p>Information about the prompts.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListQueueQuickConnectsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page. The default MaxResult size is 100.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListQueueQuickConnectsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"QuickConnectSummaryList\":{\
          \"shape\":\"QuickConnectSummaryList\",\
          \"documentation\":\"<p>Information about the quick connects.</p>\"\
        }\
      }\
    },\
    \"ListQueuesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueTypes\":{\
          \"shape\":\"QueueTypes\",\
          \"documentation\":\"<p>The type of queue.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"queueTypes\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page. The default MaxResult size is 100.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListQueuesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"QueueSummaryList\":{\
          \"shape\":\"QueueSummaryList\",\
          \"documentation\":\"<p>Information about the queues.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListQuickConnectsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page. The default MaxResult size is 100.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"QuickConnectTypes\":{\
          \"shape\":\"QuickConnectTypes\",\
          \"documentation\":\"<p>The type of quick connect. In the Amazon Connect console, when you create a quick connect, you are prompted to assign one of the following types: Agent (USER), External (PHONE_NUMBER), or Queue (QUEUE).</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"QuickConnectTypes\"\
        }\
      }\
    },\
    \"ListQuickConnectsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"QuickConnectSummaryList\":{\
          \"shape\":\"QuickConnectSummaryList\",\
          \"documentation\":\"<p>Information about the quick connects.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListRoutingProfileQueuesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RoutingProfileId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RoutingProfileId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page. The default MaxResult size is 100.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListRoutingProfileQueuesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"RoutingProfileQueueConfigSummaryList\":{\
          \"shape\":\"RoutingProfileQueueConfigSummaryList\",\
          \"documentation\":\"<p>Information about the routing profiles.</p>\"\
        }\
      }\
    },\
    \"ListRoutingProfilesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page. The default MaxResult size is 100.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListRoutingProfilesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RoutingProfileSummaryList\":{\
          \"shape\":\"RoutingProfileSummaryList\",\
          \"documentation\":\"<p>Information about the routing profiles.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListRulesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"PublishStatus\":{\
          \"shape\":\"RulePublishStatus\",\
          \"documentation\":\"<p>The publish status of the rule.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"publishStatus\"\
        },\
        \"EventSourceName\":{\
          \"shape\":\"EventSourceName\",\
          \"documentation\":\"<p>The name of the event source.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"eventSourceName\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult200\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"ListRulesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"RuleSummaryList\"],\
      \"members\":{\
        \"RuleSummaryList\":{\
          \"shape\":\"RuleSummaryList\",\
          \"documentation\":\"<p>Summary information about a rule.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListSecurityKeysRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult2\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListSecurityKeysResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecurityKeys\":{\
          \"shape\":\"SecurityKeysList\",\
          \"documentation\":\"<p>The security keys.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListSecurityProfilePermissionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SecurityProfileId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"SecurityProfileId\":{\
          \"shape\":\"SecurityProfileId\",\
          \"documentation\":\"<p>The identifier for the security profle.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"SecurityProfileId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListSecurityProfilePermissionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Permissions\":{\
          \"shape\":\"PermissionsList\",\
          \"documentation\":\"<p>The permissions granted to the security profile. For a complete list of valid permissions, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/security-profile-list.html\\\">List of security profile permissions</a>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListSecurityProfilesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page. The default MaxResult size is 100.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListSecurityProfilesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecurityProfileSummaryList\":{\
          \"shape\":\"SecurityProfileSummaryList\",\
          \"documentation\":\"<p>Information about the security profiles.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceArn\"],\
      \"members\":{\
        \"resourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource. All Amazon Connect resources (instances, queues, flows, routing profiles, etc) have an ARN. To locate the ARN for an instance, for example, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">Find your Amazon Connect instance ID/ARN</a>. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Information about the tags.</p>\"\
        }\
      }\
    },\
    \"ListTaskTemplatesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p> <important> <p>It is not expected that you set this because the value returned in the previous response is always null.</p> </important>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p> <important> <p>It is not expected that you set this.</p> </important>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"Status\":{\
          \"shape\":\"TaskTemplateStatus\",\
          \"documentation\":\"<p>Marks a template as <code>ACTIVE</code> or <code>INACTIVE</code> for a task to refer to it. Tasks can only be created from <code>ACTIVE</code> templates. If a template is marked as <code>INACTIVE</code>, then a task that refers to this template cannot be created.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"status\"\
        },\
        \"Name\":{\
          \"shape\":\"TaskTemplateName\",\
          \"documentation\":\"<p>The name of the task template.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"name\"\
        }\
      }\
    },\
    \"ListTaskTemplatesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TaskTemplates\":{\
          \"shape\":\"TaskTemplateList\",\
          \"documentation\":\"<p>Provides details about a list of task templates belonging to an instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p> <important> <p>This is always returned as a null in the response.</p> </important>\"\
        }\
      }\
    },\
    \"ListTrafficDistributionGroupUsersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrafficDistributionGroupId\"],\
      \"members\":{\
        \"TrafficDistributionGroupId\":{\
          \"shape\":\"TrafficDistributionGroupIdOrArn\",\
          \"documentation\":\"<p>The identifier of the traffic distribution group. This can be the ID or the ARN if the API is being called in the Region where the traffic distribution group was created. The ARN must be provided if the call is from the replicated Region.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrafficDistributionGroupId\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult10\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"ListTrafficDistributionGroupUsersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"TrafficDistributionGroupUserSummaryList\":{\
          \"shape\":\"TrafficDistributionGroupUserSummaryList\",\
          \"documentation\":\"<p>A list of traffic distribution group users.</p>\"\
        }\
      }\
    },\
    \"ListTrafficDistributionGroupsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"MaxResult10\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceIdOrArn\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"instanceId\"\
        }\
      }\
    },\
    \"ListTrafficDistributionGroupsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"TrafficDistributionGroupSummaryList\":{\
          \"shape\":\"TrafficDistributionGroupSummaryList\",\
          \"documentation\":\"<p>A list of traffic distribution groups.</p>\"\
        }\
      }\
    },\
    \"ListUseCasesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"IntegrationAssociationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"IntegrationAssociationId\":{\
          \"shape\":\"IntegrationAssociationId\",\
          \"documentation\":\"<p>The identifier for the integration association.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IntegrationAssociationId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      },\
      \"documentation\":\"<p>Provides summary information about the use cases for the specified integration association.</p>\"\
    },\
    \"ListUseCasesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UseCaseSummaryList\":{\
          \"shape\":\"UseCaseSummaryList\",\
          \"documentation\":\"<p>The use cases.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListUserHierarchyGroupsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page. The default MaxResult size is 100.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListUserHierarchyGroupsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserHierarchyGroupSummaryList\":{\
          \"shape\":\"HierarchyGroupSummaryList\",\
          \"documentation\":\"<p>Information about the hierarchy groups.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListUsersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page. The default MaxResult size is 100.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListUsersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserSummaryList\":{\
          \"shape\":\"UserSummaryList\",\
          \"documentation\":\"<p>Information about the users.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"Long\":{\"type\":\"long\"},\
    \"MaxResult10\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":1\
    },\
    \"MaxResult100\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"MaxResult1000\":{\
      \"type\":\"integer\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"MaxResult2\":{\
      \"type\":\"integer\",\
      \"max\":2,\
      \"min\":1\
    },\
    \"MaxResult200\":{\
      \"type\":\"integer\",\
      \"max\":200,\
      \"min\":1\
    },\
    \"MaxResult25\":{\
      \"type\":\"integer\",\
      \"max\":25,\
      \"min\":1\
    },\
    \"MaxResult7\":{\
      \"type\":\"integer\",\
      \"max\":7,\
      \"min\":1\
    },\
    \"MaximumResultReturnedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>Maximum number (1000) of tags have been returned with current request. Consider changing request parameters to get more tags.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"MediaConcurrencies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MediaConcurrency\"}\
    },\
    \"MediaConcurrency\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Channel\",\
        \"Concurrency\"\
      ],\
      \"members\":{\
        \"Channel\":{\
          \"shape\":\"Channel\",\
          \"documentation\":\"<p>The channels that agents can handle in the Contact Control Panel (CCP).</p>\"\
        },\
        \"Concurrency\":{\
          \"shape\":\"Concurrency\",\
          \"documentation\":\"<p>The number of contacts an agent can have on a channel simultaneously.</p> <p>Valid Range for <code>VOICE</code>: Minimum value of 1. Maximum value of 1.</p> <p>Valid Range for <code>CHAT</code>: Minimum value of 1. Maximum value of 10.</p> <p>Valid Range for <code>TASK</code>: Minimum value of 1. Maximum value of 10.</p>\"\
        },\
        \"CrossChannelBehavior\":{\
          \"shape\":\"CrossChannelBehavior\",\
          \"documentation\":\"<p>Defines the cross-channel routing behavior for each channel that is enabled for this Routing Profile. For example, this allows you to offer an agent a different contact from another channel when they are currently working with a contact from a Voice channel.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about which channels are supported, and how many contacts an agent can have on a channel simultaneously.</p>\"\
    },\
    \"Message\":{\"type\":\"string\"},\
    \"MetricDataCollectionsV2\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricDataV2\"}\
    },\
    \"MetricDataV2\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Metric\":{\
          \"shape\":\"MetricV2\",\
          \"documentation\":\"<p>The metric name, thresholds, and metric filters of the returned metric.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"Value\",\
          \"documentation\":\"<p>The corresponding value of the metric returned in the response.</p>\",\
          \"box\":true\
        }\
      },\
      \"documentation\":\"<p>Contains the name, thresholds, and metric filters.</p>\"\
    },\
    \"MetricFilterV2\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MetricFilterKey\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The key to use for filtering data. </p> <p>Valid metric filter keys: <code>INITIATION_METHOD</code>, <code>DISCONNECT_REASON</code>. These are the same values as the <code>InitiationMethod</code> and <code>DisconnectReason</code> in the contact record. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/ctr-data-model.html#ctr-ContactTraceRecord\\\">ContactTraceRecord</a> in the <i>Amazon Connect Administrator's Guide</i>. </p>\"\
        },\
        \"MetricFilterValues\":{\
          \"shape\":\"MetricFilterValueList\",\
          \"documentation\":\"<p>The values to use for filtering data. </p> <p>Valid metric filter values for <code>INITIATION_METHOD</code>: <code>INBOUND</code> | <code>OUTBOUND</code> | <code>TRANSFER</code> | <code>QUEUE_TRANSFER</code> | <code>CALLBACK</code> | <code>API</code> </p> <p>Valid metric filter values for <code>DISCONNECT_REASON</code>: <code>CUSTOMER_DISCONNECT</code> | <code>AGENT_DISCONNECT</code> | <code>THIRD_PARTY_DISCONNECT</code> | <code>TELECOM_PROBLEM</code> | <code>BARGED</code> | <code>CONTACT_FLOW_DISCONNECT</code> | <code>OTHER</code> | <code>EXPIRED</code> | <code>API</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the filter used when retrieving metrics. <code>MetricFiltersV2</code> can be used on the following metrics: <code>AVG_AGENT_CONNECTING_TIME</code>, <code>CONTACTS_CREATED</code>, <code>CONTACTS_HANDLED</code>, <code>SUM_CONTACTS_DISCONNECTED</code>.</p>\"\
    },\
    \"MetricFilterValueList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"MetricFiltersV2List\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricFilterV2\"},\
      \"max\":2\
    },\
    \"MetricNameV2\":{\"type\":\"string\"},\
    \"MetricResultV2\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Dimensions\":{\
          \"shape\":\"DimensionsV2Map\",\
          \"documentation\":\"<p>The dimension for the metrics.</p>\"\
        },\
        \"Collections\":{\
          \"shape\":\"MetricDataCollectionsV2\",\
          \"documentation\":\"<p>The set of metrics.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the metric results.</p>\"\
    },\
    \"MetricResultsV2\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricResultV2\"}\
    },\
    \"MetricV2\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"MetricNameV2\",\
          \"documentation\":\"<p>The name of the metric.</p> <important> <p>This parameter is required. The following Required = No is incorrect.</p> </important>\"\
        },\
        \"Threshold\":{\
          \"shape\":\"ThresholdCollections\",\
          \"documentation\":\"<p>Contains information about the threshold for service level metrics.</p>\"\
        },\
        \"MetricFilters\":{\
          \"shape\":\"MetricFiltersV2List\",\
          \"documentation\":\"<p>Contains the filters to be used when returning data.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the metric.</p>\"\
    },\
    \"MetricsV2\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricV2\"}\
    },\
    \"MinutesLimit60\":{\
      \"type\":\"integer\",\
      \"max\":59,\
      \"min\":0\
    },\
    \"MonitorCapability\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SILENT_MONITOR\",\
        \"BARGE\"\
      ]\
    },\
    \"MonitorContactRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"UserId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact.</p>\"\
        },\
        \"UserId\":{\
          \"shape\":\"AgentResourceId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\"\
        },\
        \"AllowedMonitorCapabilities\":{\
          \"shape\":\"AllowedMonitorCapabilities\",\
          \"documentation\":\"<p>Specify which monitoring actions the user is allowed to take. For example, whether the user is allowed to escalate from silent monitoring to barge.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"MonitorContactResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact.</p>\"\
        },\
        \"ContactArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The ARN of the contact.</p>\"\
        }\
      }\
    },\
    \"Name\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":0\
    },\
    \"Name128\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"(^[\\\\S].*[\\\\S]$)|(^[\\\\S]$)\"\
    },\
    \"NextToken\":{\"type\":\"string\"},\
    \"NextToken2500\":{\
      \"type\":\"string\",\
      \"max\":2500,\
      \"min\":1\
    },\
    \"NotificationContentType\":{\
      \"type\":\"string\",\
      \"enum\":[\"PLAIN_TEXT\"]\
    },\
    \"NotificationDeliveryType\":{\
      \"type\":\"string\",\
      \"enum\":[\"EMAIL\"]\
    },\
    \"NotificationRecipientType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserTags\":{\
          \"shape\":\"UserTagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }. Amazon Connect users with the specified tags will be notified.</p>\"\
        },\
        \"UserIds\":{\
          \"shape\":\"UserIdList\",\
          \"documentation\":\"<p>A list of user IDs.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The type of notification recipient.</p>\"\
    },\
    \"NumberReference\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ReferenceKey\",\
          \"documentation\":\"<p>Identifier of the number reference.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"ReferenceValue\",\
          \"documentation\":\"<p>A valid number.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a reference when the <code>referenceType</code> is <code>NUMBER</code>. Otherwise, null.</p>\"\
    },\
    \"NumericQuestionPropertyAutomationLabel\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"OVERALL_CUSTOMER_SENTIMENT_SCORE\",\
        \"OVERALL_AGENT_SENTIMENT_SCORE\",\
        \"NON_TALK_TIME\",\
        \"NON_TALK_TIME_PERCENTAGE\",\
        \"NUMBER_OF_INTERRUPTIONS\",\
        \"CONTACT_DURATION\",\
        \"AGENT_INTERACTION_DURATION\",\
        \"CUSTOMER_HOLD_TIME\"\
      ]\
    },\
    \"NumericQuestionPropertyValueAutomation\":{\
      \"type\":\"structure\",\
      \"required\":[\"Label\"],\
      \"members\":{\
        \"Label\":{\
          \"shape\":\"NumericQuestionPropertyAutomationLabel\",\
          \"documentation\":\"<p>The property label of the automation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the property value used in automation of a numeric questions. Label values are associated with minimum and maximum values for the numeric question.</p> <ul> <li> <p>Sentiment scores have a minimum value of -5 and maximum value of 5.</p> </li> <li> <p> Duration labels, such as <code>NON_TALK_TIME</code>, <code>CONTACT_DURATION</code>, <code>AGENT_INTERACTION_DURATION</code>, <code>CUSTOMER_HOLD_TIME</code> have a minimum value of 0 and maximum value of 28800.</p> </li> <li> <p>Percentages have a minimum value of 0 and maximum value of 100. </p> </li> <li> <p> <code>NUMBER_OF_INTERRUPTIONS</code> has a minimum value of 0 and maximum value of 1000.</p> </li> </ul>\"\
    },\
    \"Origin\":{\
      \"type\":\"string\",\
      \"max\":267\
    },\
    \"OriginsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Origin\"}\
    },\
    \"OutboundCallerConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OutboundCallerIdName\":{\
          \"shape\":\"OutboundCallerIdName\",\
          \"documentation\":\"<p>The caller ID name.</p>\"\
        },\
        \"OutboundCallerIdNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>The caller ID number.</p>\"\
        },\
        \"OutboundFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The outbound whisper flow to be used during an outbound call.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The outbound caller ID name, number, and outbound whisper flow.</p>\"\
    },\
    \"OutboundCallerIdName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"OutboundCallsEnabled\":{\"type\":\"boolean\"},\
    \"OutboundContactNotPermittedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The message about the contact.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The contact is not permitted.</p>\",\
      \"error\":{\"httpStatusCode\":403},\
      \"exception\":true\
    },\
    \"PEM\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"ParticipantDetails\":{\
      \"type\":\"structure\",\
      \"required\":[\"DisplayName\"],\
      \"members\":{\
        \"DisplayName\":{\
          \"shape\":\"DisplayName\",\
          \"documentation\":\"<p>Display name of the participant.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The customer's details.</p>\"\
    },\
    \"ParticipantDetailsToAdd\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ParticipantRole\":{\
          \"shape\":\"ParticipantRole\",\
          \"documentation\":\"<p>The role of the participant being added.</p>\"\
        },\
        \"DisplayName\":{\
          \"shape\":\"DisplayName\",\
          \"documentation\":\"<p>The display name of the participant.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details to add for the participant.</p>\"\
    },\
    \"ParticipantId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"ParticipantRole\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AGENT\",\
        \"CUSTOMER\",\
        \"SYSTEM\",\
        \"CUSTOM_BOT\"\
      ]\
    },\
    \"ParticipantTimerAction\":{\
      \"type\":\"string\",\
      \"enum\":[\"Unset\"]\
    },\
    \"ParticipantTimerConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ParticipantTimerConfiguration\"},\
      \"max\":6,\
      \"min\":1\
    },\
    \"ParticipantTimerConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ParticipantRole\",\
        \"TimerType\",\
        \"TimerValue\"\
      ],\
      \"members\":{\
        \"ParticipantRole\":{\
          \"shape\":\"TimerEligibleParticipantRoles\",\
          \"documentation\":\"<p>The role of the participant in the chat conversation.</p>\"\
        },\
        \"TimerType\":{\
          \"shape\":\"ParticipantTimerType\",\
          \"documentation\":\"<p>The type of timer. <code>IDLE</code> indicates the timer applies for considering a human chat participant as idle. <code>DISCONNECT_NONCUSTOMER</code> indicates the timer applies to automatically disconnecting a chat participant due to idleness.</p>\"\
        },\
        \"TimerValue\":{\
          \"shape\":\"ParticipantTimerValue\",\
          \"documentation\":\"<p>The value of the timer. Either the timer action (Unset to delete the timer), or the duration of the timer in minutes. Only one value can be set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information for the timer. After the timer configuration is set, it persists for the duration of the chat. It persists across new contacts in the chain, for example, transfer contacts.</p> <p>For more information about how chat timeouts work, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/setup-chat-timeouts.html\\\">Set up chat timeouts for human participants</a>. </p>\"\
    },\
    \"ParticipantTimerDurationInMinutes\":{\
      \"type\":\"integer\",\
      \"max\":480,\
      \"min\":2\
    },\
    \"ParticipantTimerType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IDLE\",\
        \"DISCONNECT_NONCUSTOMER\"\
      ]\
    },\
    \"ParticipantTimerValue\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ParticipantTimerAction\":{\
          \"shape\":\"ParticipantTimerAction\",\
          \"documentation\":\"<p>The timer action. Currently only one value is allowed: <code>Unset</code>. It deletes a timer.</p>\"\
        },\
        \"ParticipantTimerDurationInMinutes\":{\
          \"shape\":\"ParticipantTimerDurationInMinutes\",\
          \"documentation\":\"<p>The duration of a timer, in minutes. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The value of the timer. Either the timer action (<code>Unset</code> to delete the timer), or the duration of the timer in minutes. Only one value can be set.</p> <p>For more information about how chat timeouts work, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/setup-chat-timeouts.html\\\">Set up chat timeouts for human participants</a>. </p>\",\
      \"union\":true\
    },\
    \"ParticipantToken\":{\
      \"type\":\"string\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"ParticipantTokenCredentials\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ParticipantToken\":{\
          \"shape\":\"ParticipantToken\",\
          \"documentation\":\"<p>The token used by the chat participant to call <a href=\\\"https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html\\\">CreateParticipantConnection</a>. The participant token is valid for the lifetime of a chat participant. </p>\"\
        },\
        \"Expiry\":{\
          \"shape\":\"ISO8601Datetime\",\
          \"documentation\":\"<p>The expiration of the token. It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The credentials used by the participant.</p>\"\
    },\
    \"Password\":{\
      \"type\":\"string\",\
      \"pattern\":\"/^(?=.*[a-z])(?=.*[A-Z])(?=.*\\\\d)[a-zA-Z\\\\d\\\\S]{8,64}$/\"\
    },\
    \"Percentage\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"PermissionsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityProfilePermission\"},\
      \"max\":500\
    },\
    \"PersistentChat\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RehydrationType\":{\
          \"shape\":\"RehydrationType\",\
          \"documentation\":\"<p>The contactId that is used for rehydration depends on the rehydration type. RehydrationType is required for persistent chat. </p> <ul> <li> <p> <code>ENTIRE_PAST_SESSION</code>: Rehydrates a chat from the most recently terminated past chat contact of the specified past ended chat session. To use this type, provide the <code>initialContactId</code> of the past ended chat session in the <code>sourceContactId</code> field. In this type, Amazon Connect determines the most recent chat contact on the specified chat session that has ended, and uses it to start a persistent chat. </p> </li> <li> <p> <code>FROM_SEGMENT</code>: Rehydrates a chat from the past chat contact that is specified in the <code>sourceContactId</code> field. </p> </li> </ul> <p>The actual contactId used for rehydration is provided in the response of this API. </p>\"\
        },\
        \"SourceContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The contactId from which a persistent chat session must be started.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Enable persistent chats. For more information about enabling persistent chat, and for example use cases and how to configure for them, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/chat-persistence.html\\\">Enable persistent chat</a>.</p>\"\
    },\
    \"PhoneNumber\":{\
      \"type\":\"string\",\
      \"pattern\":\"\\\\\\\\+[1-9]\\\\\\\\d{1,14}$\"\
    },\
    \"PhoneNumberCountryCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AF\",\
        \"AL\",\
        \"DZ\",\
        \"AS\",\
        \"AD\",\
        \"AO\",\
        \"AI\",\
        \"AQ\",\
        \"AG\",\
        \"AR\",\
        \"AM\",\
        \"AW\",\
        \"AU\",\
        \"AT\",\
        \"AZ\",\
        \"BS\",\
        \"BH\",\
        \"BD\",\
        \"BB\",\
        \"BY\",\
        \"BE\",\
        \"BZ\",\
        \"BJ\",\
        \"BM\",\
        \"BT\",\
        \"BO\",\
        \"BA\",\
        \"BW\",\
        \"BR\",\
        \"IO\",\
        \"VG\",\
        \"BN\",\
        \"BG\",\
        \"BF\",\
        \"BI\",\
        \"KH\",\
        \"CM\",\
        \"CA\",\
        \"CV\",\
        \"KY\",\
        \"CF\",\
        \"TD\",\
        \"CL\",\
        \"CN\",\
        \"CX\",\
        \"CC\",\
        \"CO\",\
        \"KM\",\
        \"CK\",\
        \"CR\",\
        \"HR\",\
        \"CU\",\
        \"CW\",\
        \"CY\",\
        \"CZ\",\
        \"CD\",\
        \"DK\",\
        \"DJ\",\
        \"DM\",\
        \"DO\",\
        \"TL\",\
        \"EC\",\
        \"EG\",\
        \"SV\",\
        \"GQ\",\
        \"ER\",\
        \"EE\",\
        \"ET\",\
        \"FK\",\
        \"FO\",\
        \"FJ\",\
        \"FI\",\
        \"FR\",\
        \"PF\",\
        \"GA\",\
        \"GM\",\
        \"GE\",\
        \"DE\",\
        \"GH\",\
        \"GI\",\
        \"GR\",\
        \"GL\",\
        \"GD\",\
        \"GU\",\
        \"GT\",\
        \"GG\",\
        \"GN\",\
        \"GW\",\
        \"GY\",\
        \"HT\",\
        \"HN\",\
        \"HK\",\
        \"HU\",\
        \"IS\",\
        \"IN\",\
        \"ID\",\
        \"IR\",\
        \"IQ\",\
        \"IE\",\
        \"IM\",\
        \"IL\",\
        \"IT\",\
        \"CI\",\
        \"JM\",\
        \"JP\",\
        \"JE\",\
        \"JO\",\
        \"KZ\",\
        \"KE\",\
        \"KI\",\
        \"KW\",\
        \"KG\",\
        \"LA\",\
        \"LV\",\
        \"LB\",\
        \"LS\",\
        \"LR\",\
        \"LY\",\
        \"LI\",\
        \"LT\",\
        \"LU\",\
        \"MO\",\
        \"MK\",\
        \"MG\",\
        \"MW\",\
        \"MY\",\
        \"MV\",\
        \"ML\",\
        \"MT\",\
        \"MH\",\
        \"MR\",\
        \"MU\",\
        \"YT\",\
        \"MX\",\
        \"FM\",\
        \"MD\",\
        \"MC\",\
        \"MN\",\
        \"ME\",\
        \"MS\",\
        \"MA\",\
        \"MZ\",\
        \"MM\",\
        \"NA\",\
        \"NR\",\
        \"NP\",\
        \"NL\",\
        \"AN\",\
        \"NC\",\
        \"NZ\",\
        \"NI\",\
        \"NE\",\
        \"NG\",\
        \"NU\",\
        \"KP\",\
        \"MP\",\
        \"NO\",\
        \"OM\",\
        \"PK\",\
        \"PW\",\
        \"PA\",\
        \"PG\",\
        \"PY\",\
        \"PE\",\
        \"PH\",\
        \"PN\",\
        \"PL\",\
        \"PT\",\
        \"PR\",\
        \"QA\",\
        \"CG\",\
        \"RE\",\
        \"RO\",\
        \"RU\",\
        \"RW\",\
        \"BL\",\
        \"SH\",\
        \"KN\",\
        \"LC\",\
        \"MF\",\
        \"PM\",\
        \"VC\",\
        \"WS\",\
        \"SM\",\
        \"ST\",\
        \"SA\",\
        \"SN\",\
        \"RS\",\
        \"SC\",\
        \"SL\",\
        \"SG\",\
        \"SX\",\
        \"SK\",\
        \"SI\",\
        \"SB\",\
        \"SO\",\
        \"ZA\",\
        \"KR\",\
        \"ES\",\
        \"LK\",\
        \"SD\",\
        \"SR\",\
        \"SJ\",\
        \"SZ\",\
        \"SE\",\
        \"CH\",\
        \"SY\",\
        \"TW\",\
        \"TJ\",\
        \"TZ\",\
        \"TH\",\
        \"TG\",\
        \"TK\",\
        \"TO\",\
        \"TT\",\
        \"TN\",\
        \"TR\",\
        \"TM\",\
        \"TC\",\
        \"TV\",\
        \"VI\",\
        \"UG\",\
        \"UA\",\
        \"AE\",\
        \"GB\",\
        \"US\",\
        \"UY\",\
        \"UZ\",\
        \"VU\",\
        \"VA\",\
        \"VE\",\
        \"VN\",\
        \"WF\",\
        \"EH\",\
        \"YE\",\
        \"ZM\",\
        \"ZW\"\
      ]\
    },\
    \"PhoneNumberCountryCodes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PhoneNumberCountryCode\"},\
      \"max\":10\
    },\
    \"PhoneNumberDescription\":{\
      \"type\":\"string\",\
      \"max\":500,\
      \"min\":0,\
      \"pattern\":\"^[\\\\W\\\\S_]*\"\
    },\
    \"PhoneNumberId\":{\"type\":\"string\"},\
    \"PhoneNumberPrefix\":{\
      \"type\":\"string\",\
      \"pattern\":\"\\\\\\\\+?[0-9]{1,11}\"\
    },\
    \"PhoneNumberQuickConnectConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"PhoneNumber\"],\
      \"members\":{\
        \"PhoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number in E.164 format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a phone number for a quick connect.</p>\"\
    },\
    \"PhoneNumberStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"PhoneNumberWorkflowStatus\",\
          \"documentation\":\"<p>The status.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"PhoneNumberWorkflowMessage\",\
          \"documentation\":\"<p>The status message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The status of the phone number.</p> <ul> <li> <p> <code>CLAIMED</code> means the previous <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_ClaimedPhoneNumber.html\\\">ClaimedPhoneNumber</a> or <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdatePhoneNumber.html\\\">UpdatePhoneNumber</a> operation succeeded.</p> </li> <li> <p> <code>IN_PROGRESS</code> means a <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_ClaimedPhoneNumber.html\\\">ClaimedPhoneNumber</a> or <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdatePhoneNumber.html\\\">UpdatePhoneNumber</a> operation is still in progress and has not yet completed. You can call <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_DescribePhoneNumber.html\\\">DescribePhoneNumber</a> at a later time to verify if the previous operation has completed.</p> </li> <li> <p> <code>FAILED</code> indicates that the previous <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_ClaimedPhoneNumber.html\\\">ClaimedPhoneNumber</a> or <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdatePhoneNumber.html\\\">UpdatePhoneNumber</a> operation has failed. It will include a message indicating the failure reason. A common reason for a failure may be that the <code>TargetArn</code> value you are claiming or updating a phone number to has reached its limit of total claimed numbers. If you received a <code>FAILED</code> status from a <code>ClaimPhoneNumber</code> API call, you have one day to retry claiming the phone number before the number is released back to the inventory for other customers to claim.</p> </li> </ul>\"\
    },\
    \"PhoneNumberSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>The identifier of the phone number.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the phone number.</p>\"\
        },\
        \"PhoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number.</p>\"\
        },\
        \"PhoneNumberType\":{\
          \"shape\":\"PhoneNumberType\",\
          \"documentation\":\"<p>The type of phone number.</p>\"\
        },\
        \"PhoneNumberCountryCode\":{\
          \"shape\":\"PhoneNumberCountryCode\",\
          \"documentation\":\"<p>The ISO country code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a phone number for a contact center.</p>\"\
    },\
    \"PhoneNumberSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PhoneNumberSummary\"}\
    },\
    \"PhoneNumberType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TOLL_FREE\",\
        \"DID\",\
        \"UIFN\",\
        \"SHARED\",\
        \"THIRD_PARTY_TF\",\
        \"THIRD_PARTY_DID\"\
      ]\
    },\
    \"PhoneNumberTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PhoneNumberType\"},\
      \"max\":6\
    },\
    \"PhoneNumberWorkflowMessage\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":0,\
      \"pattern\":\"^[\\\\W\\\\S_]*\"\
    },\
    \"PhoneNumberWorkflowStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CLAIMED\",\
        \"IN_PROGRESS\",\
        \"FAILED\"\
      ]\
    },\
    \"PhoneType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SOFT_PHONE\",\
        \"DESK_PHONE\"\
      ]\
    },\
    \"Prefix\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"Priority\":{\
      \"type\":\"integer\",\
      \"max\":99,\
      \"min\":1\
    },\
    \"ProblemDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ProblemMessageString\",\
          \"documentation\":\"<p>The problem detail's message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a problem detail.</p>\"\
    },\
    \"ProblemMessageString\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"Problems\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProblemDetail\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"Prompt\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PromptARN\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the prompt.</p>\"\
        },\
        \"PromptId\":{\
          \"shape\":\"PromptId\",\
          \"documentation\":\"<p>A unique identifier for the prompt.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"CommonNameLength127\",\
          \"documentation\":\"<p>The name of the prompt.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"PromptDescription\",\
          \"documentation\":\"<p>The description of the prompt.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a prompt.</p>\"\
    },\
    \"PromptDescription\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":1\
    },\
    \"PromptId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"PromptList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Prompt\"}\
    },\
    \"PromptName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"PromptPresignedUrl\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1\
    },\
    \"PromptSearchConditionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PromptSearchCriteria\"}\
    },\
    \"PromptSearchCriteria\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OrConditions\":{\
          \"shape\":\"PromptSearchConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an OR condition.</p>\"\
        },\
        \"AndConditions\":{\
          \"shape\":\"PromptSearchConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an AND condition.</p>\"\
        },\
        \"StringCondition\":{\
          \"shape\":\"StringCondition\",\
          \"documentation\":\"<p>A leaf node condition which can be used to specify a string condition.</p> <note> <p>The currently supported values for <code>FieldName</code> are <code>name</code>, <code>description</code>, and <code>resourceID</code>.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The search criteria to be used to return prompts.</p>\"\
    },\
    \"PromptSearchFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TagFilter\":{\"shape\":\"ControlPlaneTagFilter\"}\
      },\
      \"documentation\":\"<p>Filters to be applied to search results.</p>\"\
    },\
    \"PromptSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"PromptId\",\
          \"documentation\":\"<p>The identifier of the prompt.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the prompt.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"PromptName\",\
          \"documentation\":\"<p>The name of the prompt.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the prompt.</p>\"\
    },\
    \"PromptSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PromptSummary\"}\
    },\
    \"PropertyValidationException\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"},\
        \"PropertyList\":{\"shape\":\"PropertyValidationExceptionPropertyList\"}\
      },\
      \"documentation\":\"<p>The property is not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"PropertyValidationExceptionProperty\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PropertyPath\",\
        \"Reason\",\
        \"Message\"\
      ],\
      \"members\":{\
        \"PropertyPath\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The full property path.</p>\"\
        },\
        \"Reason\":{\
          \"shape\":\"PropertyValidationExceptionReason\",\
          \"documentation\":\"<p>Why the property is not valid.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>A message describing why the property is not valid.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about why a property is not valid.</p>\"\
    },\
    \"PropertyValidationExceptionPropertyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PropertyValidationExceptionProperty\"}\
    },\
    \"PropertyValidationExceptionReason\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INVALID_FORMAT\",\
        \"UNIQUE_CONSTRAINT_VIOLATED\",\
        \"REFERENCED_RESOURCE_NOT_FOUND\",\
        \"RESOURCE_NAME_ALREADY_EXISTS\",\
        \"REQUIRED_PROPERTY_MISSING\",\
        \"NOT_SUPPORTED\"\
      ]\
    },\
    \"PutUserStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserId\",\
        \"InstanceId\",\
        \"AgentStatusId\"\
      ],\
      \"members\":{\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AgentStatusId\":{\
          \"shape\":\"AgentStatusId\",\
          \"documentation\":\"<p>The identifier of the agent status.</p>\"\
        }\
      }\
    },\
    \"PutUserStatusResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"Queue\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"CommonNameLength127\",\
          \"documentation\":\"<p>The name of the queue.</p>\"\
        },\
        \"QueueArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the queue.</p>\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"QueueDescription\",\
          \"documentation\":\"<p>The description of the queue.</p>\"\
        },\
        \"OutboundCallerConfig\":{\
          \"shape\":\"OutboundCallerConfig\",\
          \"documentation\":\"<p>The outbound caller ID name, number, and outbound whisper flow.</p>\"\
        },\
        \"HoursOfOperationId\":{\
          \"shape\":\"HoursOfOperationId\",\
          \"documentation\":\"<p>The identifier for the hours of operation.</p>\"\
        },\
        \"MaxContacts\":{\
          \"shape\":\"QueueMaxContacts\",\
          \"documentation\":\"<p>The maximum number of contacts that can be in the queue before it is considered full.</p>\",\
          \"box\":true\
        },\
        \"Status\":{\
          \"shape\":\"QueueStatus\",\
          \"documentation\":\"<p>The status of the queue.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a queue.</p>\"\
    },\
    \"QueueDescription\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":1\
    },\
    \"QueueId\":{\"type\":\"string\"},\
    \"QueueInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The unique identifier for the queue.</p>\"\
        },\
        \"EnqueueTimestamp\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp when the contact was added to the queue.</p>\"\
        }\
      },\
      \"documentation\":\"<p>If this contact was queued, this contains information about the queue. </p>\"\
    },\
    \"QueueMaxContacts\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"QueueName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"QueueQuickConnectConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"QueueId\",\
        \"ContactFlowId\"\
      ],\
      \"members\":{\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a queue for a quick connect. The flow must be of type Transfer to Queue.</p>\"\
    },\
    \"QueueReference\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier of the queue.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the queue.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a queue resource for which metrics are returned.</p>\"\
    },\
    \"QueueSearchConditionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QueueSearchCriteria\"}\
    },\
    \"QueueSearchCriteria\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OrConditions\":{\
          \"shape\":\"QueueSearchConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an OR condition.</p>\"\
        },\
        \"AndConditions\":{\
          \"shape\":\"QueueSearchConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an AND condition.</p>\"\
        },\
        \"StringCondition\":{\
          \"shape\":\"StringCondition\",\
          \"documentation\":\"<p>A leaf node condition which can be used to specify a string condition.</p> <note> <p>The currently supported values for <code>FieldName</code> are <code>name</code>, <code>description</code>, and <code>resourceID</code>.</p> </note>\"\
        },\
        \"QueueTypeCondition\":{\
          \"shape\":\"SearchableQueueType\",\
          \"documentation\":\"<p>The type of queue.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The search criteria to be used to return queues.</p> <note> <p>The <code>name</code> and <code>description</code> fields support \\\"contains\\\" queries with a minimum of 2 characters and a maximum of 25 characters. Any queries with character lengths outside of this range will throw invalid results. </p> </note>\"\
    },\
    \"QueueSearchFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TagFilter\":{\"shape\":\"ControlPlaneTagFilter\"}\
      },\
      \"documentation\":\"<p>Filters to be applied to search results.</p>\"\
    },\
    \"QueueSearchSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Queue\"}\
    },\
    \"QueueStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENABLED\",\
        \"DISABLED\"\
      ]\
    },\
    \"QueueSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier of the queue.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the queue.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"QueueName\",\
          \"documentation\":\"<p>The name of the queue.</p>\"\
        },\
        \"QueueType\":{\
          \"shape\":\"QueueType\",\
          \"documentation\":\"<p>The type of queue.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a queue.</p>\"\
    },\
    \"QueueSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QueueSummary\"}\
    },\
    \"QueueType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STANDARD\",\
        \"AGENT\"\
      ]\
    },\
    \"QueueTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QueueType\"},\
      \"max\":2\
    },\
    \"Queues\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QueueId\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"QuickConnect\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"QuickConnectARN\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the quick connect.</p>\"\
        },\
        \"QuickConnectId\":{\
          \"shape\":\"QuickConnectId\",\
          \"documentation\":\"<p>The identifier for the quick connect.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"QuickConnectName\",\
          \"documentation\":\"<p>The name of the quick connect.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"QuickConnectDescription\",\
          \"documentation\":\"<p>The description.</p>\"\
        },\
        \"QuickConnectConfig\":{\
          \"shape\":\"QuickConnectConfig\",\
          \"documentation\":\"<p>Contains information about the quick connect.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a quick connect.</p>\"\
    },\
    \"QuickConnectConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"QuickConnectType\"],\
      \"members\":{\
        \"QuickConnectType\":{\
          \"shape\":\"QuickConnectType\",\
          \"documentation\":\"<p>The type of quick connect. In the Amazon Connect console, when you create a quick connect, you are prompted to assign one of the following types: Agent (USER), External (PHONE_NUMBER), or Queue (QUEUE). </p>\"\
        },\
        \"UserConfig\":{\
          \"shape\":\"UserQuickConnectConfig\",\
          \"documentation\":\"<p>The user configuration. This is required only if QuickConnectType is USER.</p>\"\
        },\
        \"QueueConfig\":{\
          \"shape\":\"QueueQuickConnectConfig\",\
          \"documentation\":\"<p>The queue configuration. This is required only if QuickConnectType is QUEUE.</p>\"\
        },\
        \"PhoneConfig\":{\
          \"shape\":\"PhoneNumberQuickConnectConfig\",\
          \"documentation\":\"<p>The phone configuration. This is required only if QuickConnectType is PHONE_NUMBER.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains configuration settings for a quick connect.</p>\"\
    },\
    \"QuickConnectDescription\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":1\
    },\
    \"QuickConnectId\":{\"type\":\"string\"},\
    \"QuickConnectName\":{\
      \"type\":\"string\",\
      \"max\":127,\
      \"min\":1\
    },\
    \"QuickConnectSearchConditionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QuickConnectSearchCriteria\"}\
    },\
    \"QuickConnectSearchCriteria\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OrConditions\":{\
          \"shape\":\"QuickConnectSearchConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an OR condition.</p>\"\
        },\
        \"AndConditions\":{\
          \"shape\":\"QuickConnectSearchConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an AND condition.</p>\"\
        },\
        \"StringCondition\":{\
          \"shape\":\"StringCondition\",\
          \"documentation\":\"<p>A leaf node condition which can be used to specify a string condition.</p> <note> <p>The currently supported values for <code>FieldName</code> are <code>name</code>, <code>description</code>, and <code>resourceID</code>.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The search criteria to be used to return quick connects.</p>\"\
    },\
    \"QuickConnectSearchFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TagFilter\":{\"shape\":\"ControlPlaneTagFilter\"}\
      },\
      \"documentation\":\"<p>Filters to be applied to search results.</p>\"\
    },\
    \"QuickConnectSearchSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QuickConnect\"}\
    },\
    \"QuickConnectSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"QuickConnectId\",\
          \"documentation\":\"<p>The identifier for the quick connect.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the quick connect.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"QuickConnectName\",\
          \"documentation\":\"<p>The name of the quick connect.</p>\"\
        },\
        \"QuickConnectType\":{\
          \"shape\":\"QuickConnectType\",\
          \"documentation\":\"<p>The type of quick connect. In the Amazon Connect console, when you create a quick connect, you are prompted to assign one of the following types: Agent (USER), External (PHONE_NUMBER), or Queue (QUEUE).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a quick connect.</p>\"\
    },\
    \"QuickConnectSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QuickConnectSummary\"}\
    },\
    \"QuickConnectType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"USER\",\
        \"QUEUE\",\
        \"PHONE_NUMBER\"\
      ]\
    },\
    \"QuickConnectTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QuickConnectType\"},\
      \"max\":3\
    },\
    \"QuickConnectsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QuickConnectId\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"ReadOnlyFieldInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TaskTemplateFieldIdentifier\",\
          \"documentation\":\"<p>Identifier of the read-only field.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates a field that is read-only to an agent.</p>\"\
    },\
    \"ReadOnlyTaskTemplateFields\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ReadOnlyFieldInfo\"}\
    },\
    \"Reference\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Value\",\
        \"Type\"\
      ],\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"ReferenceValue\",\
          \"documentation\":\"<p>A valid value for the reference. For example, for a URL reference, a formatted URL that is displayed to an agent in the Contact Control Panel (CCP).</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"ReferenceType\",\
          \"documentation\":\"<p>The type of the reference. <code>DATE</code> must be of type Epoch timestamp. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Well-formed data on a contact, used by agents to complete a contact request. You can have up to 4,096 UTF-8 bytes across all references for a contact.</p>\"\
    },\
    \"ReferenceId\":{\
      \"type\":\"string\",\
      \"max\":40,\
      \"min\":1\
    },\
    \"ReferenceKey\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":1\
    },\
    \"ReferenceStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"APPROVED\",\
        \"REJECTED\"\
      ]\
    },\
    \"ReferenceSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Url\":{\
          \"shape\":\"UrlReference\",\
          \"documentation\":\"<p>Information about the reference when the <code>referenceType</code> is <code>URL</code>. Otherwise, null.</p>\"\
        },\
        \"Attachment\":{\
          \"shape\":\"AttachmentReference\",\
          \"documentation\":\"<p>Information about the reference when the <code>referenceType</code> is <code>ATTACHMENT</code>. Otherwise, null.</p>\"\
        },\
        \"String\":{\
          \"shape\":\"StringReference\",\
          \"documentation\":\"<p>Information about a reference when the <code>referenceType</code> is <code>STRING</code>. Otherwise, null.</p>\"\
        },\
        \"Number\":{\
          \"shape\":\"NumberReference\",\
          \"documentation\":\"<p>Information about a reference when the <code>referenceType</code> is <code>NUMBER</code>. Otherwise, null.</p>\"\
        },\
        \"Date\":{\
          \"shape\":\"DateReference\",\
          \"documentation\":\"<p>Information about a reference when the <code>referenceType</code> is <code>DATE</code>. Otherwise, null.</p>\"\
        },\
        \"Email\":{\
          \"shape\":\"EmailReference\",\
          \"documentation\":\"<p>Information about a reference when the <code>referenceType</code> is <code>EMAIL</code>. Otherwise, null.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a reference. <code>ReferenceSummary</code> contains only one non null field between the URL and attachment based on the reference type.</p>\",\
      \"union\":true\
    },\
    \"ReferenceSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ReferenceSummary\"}\
    },\
    \"ReferenceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"URL\",\
        \"ATTACHMENT\",\
        \"NUMBER\",\
        \"STRING\",\
        \"DATE\",\
        \"EMAIL\"\
      ]\
    },\
    \"ReferenceTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ReferenceType\"},\
      \"max\":6\
    },\
    \"ReferenceValue\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":0\
    },\
    \"RehydrationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENTIRE_PAST_SESSION\",\
        \"FROM_SEGMENT\"\
      ]\
    },\
    \"ReleasePhoneNumberRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"PhoneNumberId\"],\
      \"members\":{\
        \"PhoneNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>A unique identifier for the phone number.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"PhoneNumberId\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>.</p>\",\
          \"idempotencyToken\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"clientToken\"\
        }\
      }\
    },\
    \"ReplicateInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ReplicaRegion\",\
        \"ReplicaAlias\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceIdOrArn\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance. You can provide the <code>InstanceId</code>, or the entire ARN.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ReplicaRegion\":{\
          \"shape\":\"AwsRegion\",\
          \"documentation\":\"<p>The Amazon Web Services Region where to replicate the Amazon Connect instance.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"ReplicaAlias\":{\
          \"shape\":\"DirectoryAlias\",\
          \"documentation\":\"<p>The alias for the replicated instance. The <code>ReplicaAlias</code> must be unique.</p>\"\
        }\
      }\
    },\
    \"ReplicateInstanceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the replicated instance. You can find the <code>instanceId</code> in the ARN of the instance. The replicated instance has the same identifier as the instance it was replicated from.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the replicated instance.</p>\"\
        }\
      }\
    },\
    \"RequiredFieldInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TaskTemplateFieldIdentifier\",\
          \"documentation\":\"<p>The unique identifier for the field.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a required field.</p>\"\
    },\
    \"RequiredTaskTemplateFields\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RequiredFieldInfo\"}\
    },\
    \"ResourceArnOrId\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":1\
    },\
    \"ResourceConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>A resource already has that name.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"ResourceId\":{\
      \"type\":\"string\",\
      \"max\":500,\
      \"min\":1\
    },\
    \"ResourceInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"},\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The type of resource.</p>\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The identifier for the resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>That resource is already in use. Please try another.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The message about the resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The specified resource was not found.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"ResourceNotReadyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>The resource is not ready.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"ResourceTagsSearchCriteria\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TagSearchCondition\":{\
          \"shape\":\"TagSearchCondition\",\
          \"documentation\":\"<p>The search criteria to be used to return tags.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The search criteria to be used to search tags.</p>\"\
    },\
    \"ResourceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CONTACT\",\
        \"CONTACT_FLOW\",\
        \"INSTANCE\",\
        \"PARTICIPANT\",\
        \"HIERARCHY_LEVEL\",\
        \"HIERARCHY_GROUP\",\
        \"USER\"\
      ]\
    },\
    \"ResourceTypeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"ResumeContactRecordingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"InitialContactId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact.</p>\"\
        },\
        \"InitialContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>\"\
        }\
      }\
    },\
    \"ResumeContactRecordingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"RoutingProfile\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"RoutingProfileName\",\
          \"documentation\":\"<p>The name of the routing profile.</p>\"\
        },\
        \"RoutingProfileArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the routing profile.</p>\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"RoutingProfileDescription\",\
          \"documentation\":\"<p>The description of the routing profile.</p>\"\
        },\
        \"MediaConcurrencies\":{\
          \"shape\":\"MediaConcurrencies\",\
          \"documentation\":\"<p>The channels agents can handle in the Contact Control Panel (CCP) for this routing profile.</p>\"\
        },\
        \"DefaultOutboundQueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier of the default outbound queue for this routing profile.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        },\
        \"NumberOfAssociatedQueues\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The number of associated queues in routing profile.</p>\"\
        },\
        \"NumberOfAssociatedUsers\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The number of associated users in routing profile.</p>\"\
        },\
        \"AgentAvailabilityTimer\":{\
          \"shape\":\"AgentAvailabilityTimer\",\
          \"documentation\":\"<p>Whether agents with this routing profile will have their routing order calculated based on <i>time since their last inbound contact</i> or <i>longest idle time</i>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a routing profile.</p>\"\
    },\
    \"RoutingProfileDescription\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":1\
    },\
    \"RoutingProfileId\":{\"type\":\"string\"},\
    \"RoutingProfileList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RoutingProfile\"}\
    },\
    \"RoutingProfileName\":{\
      \"type\":\"string\",\
      \"max\":127,\
      \"min\":1\
    },\
    \"RoutingProfileQueueConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"QueueReference\",\
        \"Priority\",\
        \"Delay\"\
      ],\
      \"members\":{\
        \"QueueReference\":{\
          \"shape\":\"RoutingProfileQueueReference\",\
          \"documentation\":\"<p>Contains information about a queue resource.</p>\"\
        },\
        \"Priority\":{\
          \"shape\":\"Priority\",\
          \"documentation\":\"<p>The order in which contacts are to be handled for the queue. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html\\\">Queues: priority and delay</a>.</p>\",\
          \"box\":true\
        },\
        \"Delay\":{\
          \"shape\":\"Delay\",\
          \"documentation\":\"<p>The delay, in seconds, a contact should be in the queue before they are routed to an available agent. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html\\\">Queues: priority and delay</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\",\
          \"box\":true\
        }\
      },\
      \"documentation\":\"<p>Contains information about the queue and channel for which priority and delay can be set.</p>\"\
    },\
    \"RoutingProfileQueueConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RoutingProfileQueueConfig\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"RoutingProfileQueueConfigSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"QueueId\",\
        \"QueueArn\",\
        \"QueueName\",\
        \"Priority\",\
        \"Delay\",\
        \"Channel\"\
      ],\
      \"members\":{\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\"\
        },\
        \"QueueArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the queue.</p>\"\
        },\
        \"QueueName\":{\
          \"shape\":\"QueueName\",\
          \"documentation\":\"<p>The name of the queue.</p>\"\
        },\
        \"Priority\":{\
          \"shape\":\"Priority\",\
          \"documentation\":\"<p>The order in which contacts are to be handled for the queue. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html\\\">Queues: priority and delay</a>.</p>\"\
        },\
        \"Delay\":{\
          \"shape\":\"Delay\",\
          \"documentation\":\"<p>The delay, in seconds, that a contact should be in the queue before they are routed to an available agent. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html\\\">Queues: priority and delay</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
        },\
        \"Channel\":{\
          \"shape\":\"Channel\",\
          \"documentation\":\"<p>The channels this queue supports.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a routing profile queue.</p>\"\
    },\
    \"RoutingProfileQueueConfigSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RoutingProfileQueueConfigSummary\"}\
    },\
    \"RoutingProfileQueueReference\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"QueueId\",\
        \"Channel\"\
      ],\
      \"members\":{\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\"\
        },\
        \"Channel\":{\
          \"shape\":\"Channel\",\
          \"documentation\":\"<p>The channels agents can handle in the Contact Control Panel (CCP) for this routing profile.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the channel and queue identifier for a routing profile.</p>\"\
    },\
    \"RoutingProfileQueueReferenceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RoutingProfileQueueReference\"}\
    },\
    \"RoutingProfileReference\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the routing profile.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the routing profile assigned to the user.</p>\"\
    },\
    \"RoutingProfileSearchConditionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RoutingProfileSearchCriteria\"}\
    },\
    \"RoutingProfileSearchCriteria\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OrConditions\":{\
          \"shape\":\"RoutingProfileSearchConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an OR condition.</p>\"\
        },\
        \"AndConditions\":{\
          \"shape\":\"RoutingProfileSearchConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an AND condition.</p>\"\
        },\
        \"StringCondition\":{\
          \"shape\":\"StringCondition\",\
          \"documentation\":\"<p>A leaf node condition which can be used to specify a string condition.</p> <note> <p>The currently supported values for <code>FieldName</code> are <code>name</code>, <code>description</code>, and <code>resourceID</code>.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The search criteria to be used to return routing profiles.</p> <note> <p>The <code>name</code> and <code>description</code> fields support \\\"contains\\\" queries with a minimum of 2 characters and a maximum of 25 characters. Any queries with character lengths outside of this range will throw invalid results. </p> </note>\"\
    },\
    \"RoutingProfileSearchFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TagFilter\":{\"shape\":\"ControlPlaneTagFilter\"}\
      },\
      \"documentation\":\"<p>Filters to be applied to search results.</p>\"\
    },\
    \"RoutingProfileSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the routing profile.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"RoutingProfileName\",\
          \"documentation\":\"<p>The name of the routing profile.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a routing profile.</p>\"\
    },\
    \"RoutingProfileSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RoutingProfileSummary\"}\
    },\
    \"RoutingProfiles\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RoutingProfileId\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"Rule\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"RuleId\",\
        \"RuleArn\",\
        \"TriggerEventSource\",\
        \"Function\",\
        \"Actions\",\
        \"PublishStatus\",\
        \"CreatedTime\",\
        \"LastUpdatedTime\",\
        \"LastUpdatedBy\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"RuleName\",\
          \"documentation\":\"<p>The name of the rule.</p>\"\
        },\
        \"RuleId\":{\
          \"shape\":\"RuleId\",\
          \"documentation\":\"<p>A unique identifier for the rule.</p>\"\
        },\
        \"RuleArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the rule.</p>\"\
        },\
        \"TriggerEventSource\":{\
          \"shape\":\"RuleTriggerEventSource\",\
          \"documentation\":\"<p>The event source to trigger the rule.</p>\"\
        },\
        \"Function\":{\
          \"shape\":\"RuleFunction\",\
          \"documentation\":\"<p>The conditions of the rule.</p>\"\
        },\
        \"Actions\":{\
          \"shape\":\"RuleActions\",\
          \"documentation\":\"<p>A list of actions to be run when the rule is triggered.</p>\"\
        },\
        \"PublishStatus\":{\
          \"shape\":\"RulePublishStatus\",\
          \"documentation\":\"<p>The publish status of the rule.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the rule was created.</p>\"\
        },\
        \"LastUpdatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for the when the rule was last updated.</p>\"\
        },\
        \"LastUpdatedBy\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user who last updated the rule.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a rule.</p>\"\
    },\
    \"RuleAction\":{\
      \"type\":\"structure\",\
      \"required\":[\"ActionType\"],\
      \"members\":{\
        \"ActionType\":{\
          \"shape\":\"ActionType\",\
          \"documentation\":\"<p>The type of action that creates a rule.</p>\"\
        },\
        \"TaskAction\":{\
          \"shape\":\"TaskActionDefinition\",\
          \"documentation\":\"<p>Information about the task action. This field is required if <code>TriggerEventSource</code> is one of the following values: <code>OnZendeskTicketCreate</code> | <code>OnZendeskTicketStatusUpdate</code> | <code>OnSalesforceCaseCreate</code> </p>\"\
        },\
        \"EventBridgeAction\":{\
          \"shape\":\"EventBridgeActionDefinition\",\
          \"documentation\":\"<p>Information about the EventBridge action.</p>\"\
        },\
        \"AssignContactCategoryAction\":{\
          \"shape\":\"AssignContactCategoryActionDefinition\",\
          \"documentation\":\"<p>Information about the contact category action.</p>\"\
        },\
        \"SendNotificationAction\":{\
          \"shape\":\"SendNotificationActionDefinition\",\
          \"documentation\":\"<p>Information about the send notification action.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the action to be performed when a rule is triggered.</p>\"\
    },\
    \"RuleActions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RuleAction\"}\
    },\
    \"RuleFunction\":{\"type\":\"string\"},\
    \"RuleId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"RuleName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"RulePublishStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DRAFT\",\
        \"PUBLISHED\"\
      ]\
    },\
    \"RuleSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"RuleId\",\
        \"RuleArn\",\
        \"EventSourceName\",\
        \"PublishStatus\",\
        \"ActionSummaries\",\
        \"CreatedTime\",\
        \"LastUpdatedTime\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"RuleName\",\
          \"documentation\":\"<p>The name of the rule.</p>\"\
        },\
        \"RuleId\":{\
          \"shape\":\"RuleId\",\
          \"documentation\":\"<p>A unique identifier for the rule.</p>\"\
        },\
        \"RuleArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the rule.</p>\"\
        },\
        \"EventSourceName\":{\
          \"shape\":\"EventSourceName\",\
          \"documentation\":\"<p>The name of the event source.</p>\"\
        },\
        \"PublishStatus\":{\
          \"shape\":\"RulePublishStatus\",\
          \"documentation\":\"<p>The publish status of the rule.</p>\"\
        },\
        \"ActionSummaries\":{\
          \"shape\":\"ActionSummaries\",\
          \"documentation\":\"<p>A list of ActionTypes associated with a rule. </p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the rule was created. </p>\"\
        },\
        \"LastUpdatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the rule was last updated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of <code>ActionTypes</code> associated with a rule. </p>\"\
    },\
    \"RuleSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RuleSummary\"}\
    },\
    \"RuleTriggerEventSource\":{\
      \"type\":\"structure\",\
      \"required\":[\"EventSourceName\"],\
      \"members\":{\
        \"EventSourceName\":{\
          \"shape\":\"EventSourceName\",\
          \"documentation\":\"<p>The name of the event source.</p>\"\
        },\
        \"IntegrationAssociationId\":{\
          \"shape\":\"IntegrationAssociationId\",\
          \"documentation\":\"<p>The identifier for the integration association.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The name of the event source. This field is required if <code>TriggerEventSource</code> is one of the following values: <code>OnZendeskTicketCreate</code> | <code>OnZendeskTicketStatusUpdate</code> | <code>OnSalesforceCaseCreate</code> </p>\"\
    },\
    \"S3Config\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BucketName\",\
        \"BucketPrefix\"\
      ],\
      \"members\":{\
        \"BucketName\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The S3 bucket name.</p>\"\
        },\
        \"BucketPrefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>The S3 bucket prefix.</p>\"\
        },\
        \"EncryptionConfig\":{\
          \"shape\":\"EncryptionConfig\",\
          \"documentation\":\"<p>The Amazon S3 encryption configuration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the Amazon Simple Storage Service (Amazon S3) storage type.</p>\"\
    },\
    \"S3Uri\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"s3://\\\\S+/.+\"\
    },\
    \"SearchAvailablePhoneNumbersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TargetArn\",\
        \"PhoneNumberCountryCode\",\
        \"PhoneNumberType\"\
      ],\
      \"members\":{\
        \"TargetArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for Amazon Connect instances or traffic distribution groups that phone numbers are claimed to.</p>\"\
        },\
        \"PhoneNumberCountryCode\":{\
          \"shape\":\"PhoneNumberCountryCode\",\
          \"documentation\":\"<p>The ISO country code.</p>\"\
        },\
        \"PhoneNumberType\":{\
          \"shape\":\"PhoneNumberType\",\
          \"documentation\":\"<p>The type of phone number.</p>\"\
        },\
        \"PhoneNumberPrefix\":{\
          \"shape\":\"PhoneNumberPrefix\",\
          \"documentation\":\"<p>The prefix of the phone number. If provided, it must contain <code>+</code> as part of the country code.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult10\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        },\
        \"NextToken\":{\
          \"shape\":\"LargeNextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        }\
      }\
    },\
    \"SearchAvailablePhoneNumbersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"LargeNextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"AvailableNumbersList\":{\
          \"shape\":\"AvailableNumbersList\",\
          \"documentation\":\"<p>A list of available phone numbers that you can claim to your Amazon Connect instance or traffic distribution group.</p>\"\
        }\
      }\
    },\
    \"SearchHoursOfOperationsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        },\
        \"SearchFilter\":{\
          \"shape\":\"HoursOfOperationSearchFilter\",\
          \"documentation\":\"<p>Filters to be applied to search results.</p>\"\
        },\
        \"SearchCriteria\":{\
          \"shape\":\"HoursOfOperationSearchCriteria\",\
          \"documentation\":\"<p>The search criteria to be used to return hours of operations.</p>\"\
        }\
      }\
    },\
    \"SearchHoursOfOperationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HoursOfOperations\":{\
          \"shape\":\"HoursOfOperationList\",\
          \"documentation\":\"<p>Information about the hours of operations.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"ApproximateTotalCount\":{\
          \"shape\":\"ApproximateTotalCount\",\
          \"documentation\":\"<p>The total number of hours of operations which matched your search query.</p>\"\
        }\
      }\
    },\
    \"SearchPromptsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        },\
        \"SearchFilter\":{\
          \"shape\":\"PromptSearchFilter\",\
          \"documentation\":\"<p>Filters to be applied to search results.</p>\"\
        },\
        \"SearchCriteria\":{\
          \"shape\":\"PromptSearchCriteria\",\
          \"documentation\":\"<p>The search criteria to be used to return prompts.</p>\"\
        }\
      }\
    },\
    \"SearchPromptsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Prompts\":{\
          \"shape\":\"PromptList\",\
          \"documentation\":\"<p>Information about the prompts.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"ApproximateTotalCount\":{\
          \"shape\":\"ApproximateTotalCount\",\
          \"documentation\":\"<p>The total number of quick connects which matched your search query.</p>\"\
        }\
      }\
    },\
    \"SearchQueuesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        },\
        \"SearchFilter\":{\
          \"shape\":\"QueueSearchFilter\",\
          \"documentation\":\"<p>Filters to be applied to search results.</p>\"\
        },\
        \"SearchCriteria\":{\
          \"shape\":\"QueueSearchCriteria\",\
          \"documentation\":\"<p>The search criteria to be used to return queues.</p> <note> <p>The <code>name</code> and <code>description</code> fields support \\\"contains\\\" queries with a minimum of 2 characters and a maximum of 25 characters. Any queries with character lengths outside of this range will throw invalid results. </p> </note>\"\
        }\
      }\
    },\
    \"SearchQueuesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Queues\":{\
          \"shape\":\"QueueSearchSummaryList\",\
          \"documentation\":\"<p>Information about the queues.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"ApproximateTotalCount\":{\
          \"shape\":\"ApproximateTotalCount\",\
          \"documentation\":\"<p>The total number of queues which matched your search query.</p>\"\
        }\
      }\
    },\
    \"SearchQuickConnectsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        },\
        \"SearchFilter\":{\
          \"shape\":\"QuickConnectSearchFilter\",\
          \"documentation\":\"<p>Filters to be applied to search results.</p>\"\
        },\
        \"SearchCriteria\":{\
          \"shape\":\"QuickConnectSearchCriteria\",\
          \"documentation\":\"<p>The search criteria to be used to return quick connects.</p>\"\
        }\
      }\
    },\
    \"SearchQuickConnectsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"QuickConnects\":{\
          \"shape\":\"QuickConnectSearchSummaryList\",\
          \"documentation\":\"<p>Information about the quick connects.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"ApproximateTotalCount\":{\
          \"shape\":\"ApproximateTotalCount\",\
          \"documentation\":\"<p>The total number of quick connects which matched your search query.</p>\"\
        }\
      }\
    },\
    \"SearchResourceTagsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceIdOrArn\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"ResourceTypes\":{\
          \"shape\":\"ResourceTypeList\",\
          \"documentation\":\"<p>The list of resource types to be used to search tags from. If not provided or if any empty list is provided, this API will search from all supported resource types.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        },\
        \"SearchCriteria\":{\
          \"shape\":\"ResourceTagsSearchCriteria\",\
          \"documentation\":\"<p>The search criteria to be used to return tags.</p>\"\
        }\
      }\
    },\
    \"SearchResourceTagsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagsList\",\
          \"documentation\":\"<p>A list of tags used in the Amazon Connect instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"SearchRoutingProfilesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        },\
        \"SearchFilter\":{\
          \"shape\":\"RoutingProfileSearchFilter\",\
          \"documentation\":\"<p>Filters to be applied to search results.</p>\"\
        },\
        \"SearchCriteria\":{\
          \"shape\":\"RoutingProfileSearchCriteria\",\
          \"documentation\":\"<p>The search criteria to be used to return routing profiles.</p> <note> <p>The <code>name</code> and <code>description</code> fields support \\\"contains\\\" queries with a minimum of 2 characters and a maximum of 25 characters. Any queries with character lengths outside of this range will throw invalid results. </p> </note>\"\
        }\
      }\
    },\
    \"SearchRoutingProfilesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RoutingProfiles\":{\
          \"shape\":\"RoutingProfileList\",\
          \"documentation\":\"<p>Information about the routing profiles.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"ApproximateTotalCount\":{\
          \"shape\":\"ApproximateTotalCount\",\
          \"documentation\":\"<p>The total number of routing profiles which matched your search query.</p>\"\
        }\
      }\
    },\
    \"SearchSecurityProfilesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        },\
        \"SearchCriteria\":{\
          \"shape\":\"SecurityProfileSearchCriteria\",\
          \"documentation\":\"<p>The search criteria to be used to return security profiles. </p> <note> <p>The <code>name</code> field support \\\"contains\\\" queries with a minimum of 2 characters and maximum of 25 characters. Any queries with character lengths outside of this range will throw invalid results.</p> </note> <note> <p>The currently supported value for <code>FieldName</code>: <code>name</code> </p> </note>\"\
        },\
        \"SearchFilter\":{\
          \"shape\":\"SecurityProfilesSearchFilter\",\
          \"documentation\":\"<p>Filters to be applied to search results.</p>\"\
        }\
      }\
    },\
    \"SearchSecurityProfilesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecurityProfiles\":{\
          \"shape\":\"SecurityProfilesSearchSummaryList\",\
          \"documentation\":\"<p>Information about the security profiles.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"ApproximateTotalCount\":{\
          \"shape\":\"ApproximateTotalCount\",\
          \"documentation\":\"<p>The total number of security profiles which matched your search query.</p>\"\
        }\
      }\
    },\
    \"SearchUsersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        },\
        \"SearchFilter\":{\
          \"shape\":\"UserSearchFilter\",\
          \"documentation\":\"<p>Filters to be applied to search results.</p>\"\
        },\
        \"SearchCriteria\":{\"shape\":\"UserSearchCriteria\"}\
      }\
    },\
    \"SearchUsersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Users\":{\
          \"shape\":\"UserSearchSummaryList\",\
          \"documentation\":\"<p>Information about the users.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"ApproximateTotalCount\":{\
          \"shape\":\"ApproximateTotalCount\",\
          \"documentation\":\"<p>The total number of users who matched your search query.</p>\"\
        }\
      }\
    },\
    \"SearchVocabulariesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"VocabularyNextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The current state of the custom vocabulary.</p>\"\
        },\
        \"NameStartsWith\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The starting pattern of the name of the vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"VocabularyLanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html\\\">What is Amazon Transcribe?</a> </p>\"\
        }\
      }\
    },\
    \"SearchVocabulariesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularySummaryList\":{\
          \"shape\":\"VocabularySummaryList\",\
          \"documentation\":\"<p>The list of the available custom vocabularies.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"VocabularyNextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"SearchableQueueType\":{\
      \"type\":\"string\",\
      \"enum\":[\"STANDARD\"]\
    },\
    \"SecurityKey\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AssociationId\":{\
          \"shape\":\"AssociationId\",\
          \"documentation\":\"<p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>\"\
        },\
        \"Key\":{\
          \"shape\":\"PEM\",\
          \"documentation\":\"<p>The key of the security key.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>When the security key was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information of the security key.</p>\"\
    },\
    \"SecurityKeysList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityKey\"}\
    },\
    \"SecurityProfile\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"SecurityProfileId\",\
          \"documentation\":\"<p>The identifier for the security profile.</p>\"\
        },\
        \"OrganizationResourceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The organization resource identifier for the security profile.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the secruity profile.</p>\"\
        },\
        \"SecurityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The name for the security profile.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"SecurityProfileDescription\",\
          \"documentation\":\"<p>The description of the security profile.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        },\
        \"AllowedAccessControlTags\":{\
          \"shape\":\"AllowedAccessControlTags\",\
          \"documentation\":\"<p>The list of tags that a security profile uses to restrict access to resources in Amazon Connect.</p>\"\
        },\
        \"TagRestrictedResources\":{\
          \"shape\":\"TagRestrictedResourceList\",\
          \"documentation\":\"<p>The list of resources that a security profile applies tag restrictions to in Amazon Connect.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a security profile.</p>\"\
    },\
    \"SecurityProfileDescription\":{\
      \"type\":\"string\",\
      \"max\":250\
    },\
    \"SecurityProfileId\":{\"type\":\"string\"},\
    \"SecurityProfileIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityProfileId\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"SecurityProfileName\":{\"type\":\"string\"},\
    \"SecurityProfilePermission\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"SecurityProfilePolicyKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"SecurityProfilePolicyValue\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"SecurityProfileSearchConditionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityProfileSearchCriteria\"}\
    },\
    \"SecurityProfileSearchCriteria\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OrConditions\":{\
          \"shape\":\"SecurityProfileSearchConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an OR condition.</p>\"\
        },\
        \"AndConditions\":{\
          \"shape\":\"SecurityProfileSearchConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an AND condition.</p>\"\
        },\
        \"StringCondition\":{\"shape\":\"StringCondition\"}\
      },\
      \"documentation\":\"<p>The search criteria to be used to return security profiles.</p> <note> <p>The <code>name</code> field support \\\"contains\\\" queries with a minimum of 2 characters and maximum of 25 characters. Any queries with character lengths outside of this range will throw invalid results.</p> </note>\"\
    },\
    \"SecurityProfileSearchSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"SecurityProfileId\",\
          \"documentation\":\"<p>The identifier of the security profile.</p>\"\
        },\
        \"OrganizationResourceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The organization resource identifier.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the security profile.</p>\"\
        },\
        \"SecurityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The name of the security profile.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"SecurityProfileDescription\",\
          \"documentation\":\"<p>The description of the security profile.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the returned security profiles.</p>\"\
    },\
    \"SecurityProfileSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"SecurityProfileId\",\
          \"documentation\":\"<p>The identifier of the security profile.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the security profile.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The name of the security profile.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a security profile.</p>\"\
    },\
    \"SecurityProfileSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityProfileSummary\"}\
    },\
    \"SecurityProfilesSearchFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TagFilter\":{\"shape\":\"ControlPlaneTagFilter\"}\
      },\
      \"documentation\":\"<p>Filters to be applied to search results.</p>\"\
    },\
    \"SecurityProfilesSearchSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityProfileSearchSummary\"}\
    },\
    \"SecurityToken\":{\
      \"type\":\"string\",\
      \"sensitive\":true\
    },\
    \"SendNotificationActionDefinition\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeliveryMethod\",\
        \"Content\",\
        \"ContentType\",\
        \"Recipient\"\
      ],\
      \"members\":{\
        \"DeliveryMethod\":{\
          \"shape\":\"NotificationDeliveryType\",\
          \"documentation\":\"<p>Notification delivery method.</p>\"\
        },\
        \"Subject\":{\
          \"shape\":\"Subject\",\
          \"documentation\":\"<p>The subject of the email if the delivery method is <code>EMAIL</code>. Supports variable injection. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/contact-lens-variable-injection.html\\\">JSONPath reference</a> in the <i>Amazon Connect Administrators Guide</i>.</p>\"\
        },\
        \"Content\":{\
          \"shape\":\"Content\",\
          \"documentation\":\"<p>Notification content. Supports variable injection. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/contact-lens-variable-injection.html\\\">JSONPath reference</a> in the <i>Amazon Connect Administrators Guide</i>.</p>\"\
        },\
        \"ContentType\":{\
          \"shape\":\"NotificationContentType\",\
          \"documentation\":\"<p>Content type format.</p>\"\
        },\
        \"Recipient\":{\
          \"shape\":\"NotificationRecipientType\",\
          \"documentation\":\"<p>Notification recipient.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the send notification action.</p>\"\
    },\
    \"ServiceQuotaExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>The service quota has been exceeded.</p>\",\
      \"error\":{\"httpStatusCode\":402},\
      \"exception\":true\
    },\
    \"SignInConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"Distributions\"],\
      \"members\":{\
        \"Distributions\":{\
          \"shape\":\"SignInDistributionList\",\
          \"documentation\":\"<p>Information about traffic distributions.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The distribution of allowing signing in to the instance and its replica(s).</p>\"\
    },\
    \"SignInDistribution\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Region\",\
        \"Enabled\"\
      ],\
      \"members\":{\
        \"Region\":{\
          \"shape\":\"AwsRegion\",\
          \"documentation\":\"<p>The Amazon Web Services Region of the sign in distribution.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether sign in distribution is enabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The distribution of sign in traffic between the instance and its replica(s).</p>\"\
    },\
    \"SignInDistributionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SignInDistribution\"}\
    },\
    \"SingleSelectOptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TaskTemplateSingleSelectOption\"}\
    },\
    \"SingleSelectQuestionRuleCategoryAutomation\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Category\",\
        \"Condition\",\
        \"OptionRefId\"\
      ],\
      \"members\":{\
        \"Category\":{\
          \"shape\":\"SingleSelectQuestionRuleCategoryAutomationLabel\",\
          \"documentation\":\"<p> The category name, as defined in Rules.</p>\"\
        },\
        \"Condition\":{\
          \"shape\":\"SingleSelectQuestionRuleCategoryAutomationCondition\",\
          \"documentation\":\"<p>The condition to apply for the automation option. If the condition is <code>PRESENT</code>, then the option is applied when the contact data includes the category. Similarly, if the condition is <code>NOT_PRESENT</code>, then the option is applied when the contact data does not include the category.</p>\"\
        },\
        \"OptionRefId\":{\
          \"shape\":\"ReferenceId\",\
          \"documentation\":\"<p>The identifier of the answer option.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the automation option based on a rule category for a single select question.</p>\"\
    },\
    \"SingleSelectQuestionRuleCategoryAutomationCondition\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PRESENT\",\
        \"NOT_PRESENT\"\
      ]\
    },\
    \"SingleSelectQuestionRuleCategoryAutomationLabel\":{\
      \"type\":\"string\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"SnapshotVersion\":{\"type\":\"string\"},\
    \"SortOrder\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ASCENDING\",\
        \"DESCENDING\"\
      ]\
    },\
    \"SourceApplicationName\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9_ -]+$\"\
    },\
    \"SourceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SALESFORCE\",\
        \"ZENDESK\"\
      ]\
    },\
    \"StartChatContactRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowId\",\
        \"ParticipantDetails\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow for initiating the chat. To see the ContactFlowId in the Amazon Connect console user interface, on the navigation menu go to <b>Routing</b>, <b>Contact Flows</b>. Choose the flow. On the flow page, under the name of the flow, choose <b>Show additional flow information</b>. The ContactFlowId is the last part of the ARN, shown here in bold: </p> <p>arn:aws:connect:us-west-2:xxxxxxxxxxxx:instance/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/contact-flow/<b>846ec553-a005-41c0-8341-xxxxxxxxxxxx</b> </p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>A custom key-value pair using an attribute map. The attributes are standard Amazon Connect attributes. They can be accessed in flows just like any other contact attributes. </p> <p>There can be up to 32,768 UTF-8 bytes across all key-value pairs per contact. Attribute keys can include only alphanumeric, dash, and underscore characters.</p>\"\
        },\
        \"ParticipantDetails\":{\
          \"shape\":\"ParticipantDetails\",\
          \"documentation\":\"<p>Information identifying the participant.</p>\"\
        },\
        \"InitialMessage\":{\
          \"shape\":\"ChatMessage\",\
          \"documentation\":\"<p>The initial message to be sent to the newly created chat.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"ChatDurationInMinutes\":{\
          \"shape\":\"ChatDurationInMinutes\",\
          \"documentation\":\"<p>The total duration of the newly started chat session. If not specified, the chat session duration defaults to 25 hour. The minimum configurable time is 60 minutes. The maximum configurable time is 10,080 minutes (7 days).</p>\"\
        },\
        \"SupportedMessagingContentTypes\":{\
          \"shape\":\"SupportedMessagingContentTypes\",\
          \"documentation\":\"<p>The supported chat message content types. Supported types are <code>text/plain</code>, <code>text/markdown</code>, <code>application/json</code>, <code>application/vnd.amazonaws.connect.message.interactive</code>, and <code>application/vnd.amazonaws.connect.message.interactive.response</code>. </p> <p>Content types must always contain <code>text/plain</code>. You can then put any other supported type in the list. For example, all the following lists are valid because they contain <code>text/plain</code>: <code>[text/plain, text/markdown, application/json]</code>, <code>[text/markdown, text/plain]</code>, <code>[text/plain, application/json, application/vnd.amazonaws.connect.message.interactive.response]</code>. </p> <note> <p>The type <code>application/vnd.amazonaws.connect.message.interactive</code> is required to use the <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/show-view-block.html\\\">Show view</a> flow block.</p> </note>\"\
        },\
        \"PersistentChat\":{\
          \"shape\":\"PersistentChat\",\
          \"documentation\":\"<p>Enable persistent chats. For more information about enabling persistent chat, and for example use cases and how to configure for them, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/chat-persistence.html\\\">Enable persistent chat</a>.</p>\"\
        },\
        \"RelatedContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The unique identifier for an Amazon Connect contact. This identifier is related to the chat starting.</p> <note> <p>You cannot provide data for both RelatedContactId and PersistentChat. </p> </note>\"\
        }\
      }\
    },\
    \"StartChatContactResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of this contact within the Amazon Connect instance. </p>\"\
        },\
        \"ParticipantId\":{\
          \"shape\":\"ParticipantId\",\
          \"documentation\":\"<p>The identifier for a chat participant. The participantId for a chat participant is the same throughout the chat lifecycle.</p>\"\
        },\
        \"ParticipantToken\":{\
          \"shape\":\"ParticipantToken\",\
          \"documentation\":\"<p>The token used by the chat participant to call <a href=\\\"https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html\\\">CreateParticipantConnection</a>. The participant token is valid for the lifetime of a chat participant.</p>\"\
        },\
        \"ContinuedFromContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The contactId from which a persistent chat session is started. This field is populated only for persistent chats.</p>\"\
        }\
      }\
    },\
    \"StartContactEvaluationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"EvaluationFormId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact in this instance of Amazon Connect. </p>\"\
        },\
        \"EvaluationFormId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The unique identifier for the evaluation form.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"StartContactEvaluationResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EvaluationId\",\
        \"EvaluationArn\"\
      ],\
      \"members\":{\
        \"EvaluationId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>A unique identifier for the contact evaluation.</p>\"\
        },\
        \"EvaluationArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the contact evaluation resource.</p>\"\
        }\
      }\
    },\
    \"StartContactRecordingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"InitialContactId\",\
        \"VoiceRecordingConfiguration\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact.</p>\"\
        },\
        \"InitialContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>\"\
        },\
        \"VoiceRecordingConfiguration\":{\
          \"shape\":\"VoiceRecordingConfiguration\",\
          \"documentation\":\"<p>The person being recorded.</p>\"\
        }\
      }\
    },\
    \"StartContactRecordingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"StartContactStreamingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"ChatStreamingConfiguration\",\
        \"ClientToken\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>\"\
        },\
        \"ChatStreamingConfiguration\":{\
          \"shape\":\"ChatStreamingConfiguration\",\
          \"documentation\":\"<p>The streaming configuration, such as the Amazon SNS streaming endpoint.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"StartContactStreamingResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"StreamingId\"],\
      \"members\":{\
        \"StreamingId\":{\
          \"shape\":\"StreamingId\",\
          \"documentation\":\"<p>The identifier of the streaming configuration enabled. </p>\"\
        }\
      }\
    },\
    \"StartOutboundVoiceContactRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DestinationPhoneNumber\",\
        \"ContactFlowId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"DestinationPhoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number of the customer, in E.164 format.</p>\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow for the outbound call. To see the ContactFlowId in the Amazon Connect console user interface, on the navigation menu go to <b>Routing</b>, <b>Contact Flows</b>. Choose the flow. On the flow page, under the name of the flow, choose <b>Show additional flow information</b>. The ContactFlowId is the last part of the ARN, shown here in bold: </p> <p>arn:aws:connect:us-west-2:xxxxxxxxxxxx:instance/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/contact-flow/<b>846ec553-a005-41c0-8341-xxxxxxxxxxxx</b> </p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>. The token is valid for 7 days after creation. If a contact is already started, the contact ID is returned. </p>\",\
          \"idempotencyToken\":true\
        },\
        \"SourcePhoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number associated with the Amazon Connect instance, in E.164 format. If you do not specify a source phone number, you must specify a queue.</p>\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The queue for the call. If you specify a queue, the phone displayed for caller ID is the phone number specified in the queue. If you do not specify a queue, the queue defined in the flow is used. If you do not specify a queue, you must specify a source phone number.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>A custom key-value pair using an attribute map. The attributes are standard Amazon Connect attributes, and can be accessed in flows just like any other contact attributes.</p> <p>There can be up to 32,768 UTF-8 bytes across all key-value pairs per contact. Attribute keys can include only alphanumeric, dash, and underscore characters.</p>\"\
        },\
        \"AnswerMachineDetectionConfig\":{\
          \"shape\":\"AnswerMachineDetectionConfig\",\
          \"documentation\":\"<p>Configuration of the answering machine detection for this outbound call. </p>\"\
        },\
        \"CampaignId\":{\
          \"shape\":\"CampaignId\",\
          \"documentation\":\"<p>The campaign identifier of the outbound communication.</p>\"\
        },\
        \"TrafficType\":{\
          \"shape\":\"TrafficType\",\
          \"documentation\":\"<p>Denotes the class of traffic. Calls with different traffic types are handled differently by Amazon Connect. The default value is <code>GENERAL</code>. Use <code>CAMPAIGN</code> if <code>EnableAnswerMachineDetection</code> is set to <code>true</code>. For all other cases, use <code>GENERAL</code>. </p>\"\
        }\
      }\
    },\
    \"StartOutboundVoiceContactResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of this contact within the Amazon Connect instance.</p>\"\
        }\
      }\
    },\
    \"StartTaskContactRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"PreviousContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the previous chat, voice, or task contact. </p>\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow for initiating the tasks. To see the ContactFlowId in the Amazon Connect console user interface, on the navigation menu go to <b>Routing</b>, <b>Contact Flows</b>. Choose the flow. On the flow page, under the name of the flow, choose <b>Show additional flow information</b>. The ContactFlowId is the last part of the ARN, shown here in bold: </p> <p>arn:aws:connect:us-west-2:xxxxxxxxxxxx:instance/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/contact-flow/<b>846ec553-a005-41c0-8341-xxxxxxxxxxxx</b> </p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>A custom key-value pair using an attribute map. The attributes are standard Amazon Connect attributes, and can be accessed in flows just like any other contact attributes.</p> <p>There can be up to 32,768 UTF-8 bytes across all key-value pairs per contact. Attribute keys can include only alphanumeric, dash, and underscore characters.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of a task that is shown to an agent in the Contact Control Panel (CCP).</p>\"\
        },\
        \"References\":{\
          \"shape\":\"ContactReferences\",\
          \"documentation\":\"<p>A formatted URL that is shown to an agent in the Contact Control Panel (CCP).</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the task that is shown to an agent in the Contact Control Panel (CCP).</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"ScheduledTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp, in Unix Epoch seconds format, at which to start running the inbound flow. The scheduled time cannot be in the past. It must be within up to 6 days in future. </p>\"\
        },\
        \"TaskTemplateId\":{\
          \"shape\":\"TaskTemplateId\",\
          \"documentation\":\"<p>A unique identifier for the task template.</p>\"\
        },\
        \"QuickConnectId\":{\
          \"shape\":\"QuickConnectId\",\
          \"documentation\":\"<p>The identifier for the quick connect.</p>\"\
        },\
        \"RelatedContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The contactId that is <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/tasks.html#linked-tasks\\\">related</a> to this contact.</p>\"\
        }\
      }\
    },\
    \"StartTaskContactResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of this contact within the Amazon Connect instance.</p>\"\
        }\
      }\
    },\
    \"Statistic\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SUM\",\
        \"MAX\",\
        \"AVG\"\
      ]\
    },\
    \"StopContactRecordingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"InitialContactId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact.</p>\"\
        },\
        \"InitialContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>\"\
        }\
      }\
    },\
    \"StopContactRecordingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"StopContactRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ContactId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The ID of the contact.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        }\
      }\
    },\
    \"StopContactResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"StopContactStreamingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"StreamingId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact. This is the identifier of the contact that is associated with the first interaction with the contact center.</p>\"\
        },\
        \"StreamingId\":{\
          \"shape\":\"StreamingId\",\
          \"documentation\":\"<p>The identifier of the streaming configuration enabled. </p>\"\
        }\
      }\
    },\
    \"StopContactStreamingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"StorageType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"S3\",\
        \"KINESIS_VIDEO_STREAM\",\
        \"KINESIS_STREAM\",\
        \"KINESIS_FIREHOSE\"\
      ]\
    },\
    \"StreamingId\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"String\":{\"type\":\"string\"},\
    \"StringComparisonType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STARTS_WITH\",\
        \"CONTAINS\",\
        \"EXACT\"\
      ]\
    },\
    \"StringCondition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FieldName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the field in the string condition.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The value of the string.</p>\"\
        },\
        \"ComparisonType\":{\
          \"shape\":\"StringComparisonType\",\
          \"documentation\":\"<p>The type of comparison to be made when evaluating the string condition.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A leaf node condition which can be used to specify a string condition. </p>\"\
    },\
    \"StringReference\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ReferenceKey\",\
          \"documentation\":\"<p>Identifier of the string reference.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"ReferenceValue\",\
          \"documentation\":\"<p>A valid string.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a reference when the <code>referenceType</code> is <code>STRING</code>. Otherwise, null.</p>\"\
    },\
    \"Subject\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1\
    },\
    \"SubmitContactEvaluationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"EvaluationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"EvaluationId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>A unique identifier for the contact evaluation.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EvaluationId\"\
        },\
        \"Answers\":{\
          \"shape\":\"EvaluationAnswersInputMap\",\
          \"documentation\":\"<p>A map of question identifiers to answer value.</p>\"\
        },\
        \"Notes\":{\
          \"shape\":\"EvaluationNotesMap\",\
          \"documentation\":\"<p>A map of question identifiers to note value.</p>\"\
        }\
      }\
    },\
    \"SubmitContactEvaluationResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EvaluationId\",\
        \"EvaluationArn\"\
      ],\
      \"members\":{\
        \"EvaluationId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>A unique identifier for the contact evaluation.</p>\"\
        },\
        \"EvaluationArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the contact evaluation resource.</p>\"\
        }\
      }\
    },\
    \"SupportedMessagingContentType\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"SupportedMessagingContentTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SupportedMessagingContentType\"}\
    },\
    \"SuspendContactRecordingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"InitialContactId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact.</p>\"\
        },\
        \"InitialContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>\"\
        }\
      }\
    },\
    \"SuspendContactRecordingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"TagAndConditionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagCondition\"}\
    },\
    \"TagCondition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TagKey\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The tag key in the tag condition.</p>\"\
        },\
        \"TagValue\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The tag value in the tag condition.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A leaf node condition which can be used to specify a tag condition, for example, <code>HAVE BPO = 123</code>. </p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^(?!aws:)[a-zA-Z+-=._:/]+$\"\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagKeyString\":{\
      \"type\":\"string\",\
      \"max\":128\
    },\
    \"TagMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TagKey\"},\
      \"value\":{\"shape\":\"TagValue\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagOrConditionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagAndConditionList\"}\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceArn\",\
        \"tags\"\
      ],\
      \"members\":{\
        \"resourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        },\
        \"tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      }\
    },\
    \"TagRestrictedResourceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagRestrictedResourceName\"},\
      \"max\":10\
    },\
    \"TagRestrictedResourceName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"TagSearchCondition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"tagKey\":{\
          \"shape\":\"TagKeyString\",\
          \"documentation\":\"<p>The tag key used in the tag search condition.</p>\"\
        },\
        \"tagValue\":{\
          \"shape\":\"TagValueString\",\
          \"documentation\":\"<p>The tag value used in the tag search condition.</p>\"\
        },\
        \"tagKeyComparisonType\":{\
          \"shape\":\"StringComparisonType\",\
          \"documentation\":\"<p>The type of comparison to be made when evaluating the tag key in tag search condition.</p>\"\
        },\
        \"tagValueComparisonType\":{\
          \"shape\":\"StringComparisonType\",\
          \"documentation\":\"<p>The type of comparison to be made when evaluating the tag value in tag search condition.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The search criteria to be used to return tags.</p>\"\
    },\
    \"TagSet\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The tag key in the tagSet.</p>\"\
        },\
        \"value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>The tag value in the tagSet.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A tag set contains tag key and tag value.</p>\"\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"TagValueString\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"TagsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagSet\"}\
    },\
    \"TaskActionDefinition\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"ContactFlowId\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"TaskNameExpression\",\
          \"documentation\":\"<p>The name. Supports variable injection. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/contact-lens-variable-injection.html\\\">JSONPath reference</a> in the <i>Amazon Connect Administrators Guide</i>.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"TaskDescriptionExpression\",\
          \"documentation\":\"<p>The description. Supports variable injection. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/contact-lens-variable-injection.html\\\">JSONPath reference</a> in the <i>Amazon Connect Administrators Guide</i>.</p>\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow.</p>\"\
        },\
        \"References\":{\
          \"shape\":\"ContactReferences\",\
          \"documentation\":\"<p>Information about the reference when the <code>referenceType</code> is <code>URL</code>. Otherwise, null. (Supports variable injection in the <code>Value</code> field.)</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the task action.</p>\"\
    },\
    \"TaskDescriptionExpression\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":0\
    },\
    \"TaskNameExpression\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1\
    },\
    \"TaskTemplateArn\":{\
      \"type\":\"string\",\
      \"max\":500,\
      \"min\":1\
    },\
    \"TaskTemplateConstraints\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RequiredFields\":{\
          \"shape\":\"RequiredTaskTemplateFields\",\
          \"documentation\":\"<p>Lists the fields that are required to be filled by agents.</p>\"\
        },\
        \"ReadOnlyFields\":{\
          \"shape\":\"ReadOnlyTaskTemplateFields\",\
          \"documentation\":\"<p>Lists the fields that are read-only to agents, and cannot be edited.</p>\"\
        },\
        \"InvisibleFields\":{\
          \"shape\":\"InvisibleTaskTemplateFields\",\
          \"documentation\":\"<p>Lists the fields that are invisible to agents.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes constraints that apply to the template fields.</p>\"\
    },\
    \"TaskTemplateDefaultFieldValue\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TaskTemplateFieldIdentifier\",\
          \"documentation\":\"<p>Identifier of a field. </p>\"\
        },\
        \"DefaultValue\":{\
          \"shape\":\"TaskTemplateFieldValue\",\
          \"documentation\":\"<p>Default value for the field.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a default field and its corresponding value.</p>\"\
    },\
    \"TaskTemplateDefaultFieldValueList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TaskTemplateDefaultFieldValue\"}\
    },\
    \"TaskTemplateDefaults\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DefaultFieldValues\":{\
          \"shape\":\"TaskTemplateDefaultFieldValueList\",\
          \"documentation\":\"<p>Default value for the field.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes default values for fields on a template.</p>\"\
    },\
    \"TaskTemplateDescription\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"TaskTemplateField\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TaskTemplateFieldIdentifier\",\
          \"documentation\":\"<p>The unique identifier for the field.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"TaskTemplateFieldDescription\",\
          \"documentation\":\"<p>The description of the field.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"TaskTemplateFieldType\",\
          \"documentation\":\"<p>Indicates the type of field.</p>\"\
        },\
        \"SingleSelectOptions\":{\
          \"shape\":\"SingleSelectOptions\",\
          \"documentation\":\"<p>A list of options for a single select field.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a single task template field.</p>\"\
    },\
    \"TaskTemplateFieldDescription\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"TaskTemplateFieldIdentifier\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"TaskTemplateFieldName\",\
          \"documentation\":\"<p>The name of the task template field.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The identifier of the task template field.</p>\"\
    },\
    \"TaskTemplateFieldName\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"TaskTemplateFieldType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NAME\",\
        \"DESCRIPTION\",\
        \"SCHEDULED_TIME\",\
        \"QUICK_CONNECT\",\
        \"URL\",\
        \"NUMBER\",\
        \"TEXT\",\
        \"TEXT_AREA\",\
        \"DATE_TIME\",\
        \"BOOLEAN\",\
        \"SINGLE_SELECT\",\
        \"EMAIL\"\
      ]\
    },\
    \"TaskTemplateFieldValue\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":0\
    },\
    \"TaskTemplateFields\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TaskTemplateField\"}\
    },\
    \"TaskTemplateId\":{\
      \"type\":\"string\",\
      \"max\":500,\
      \"min\":1\
    },\
    \"TaskTemplateList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TaskTemplateMetadata\"}\
    },\
    \"TaskTemplateMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TaskTemplateId\",\
          \"documentation\":\"<p>A unique identifier for the task template.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"TaskTemplateArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the task template.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"TaskTemplateName\",\
          \"documentation\":\"<p>The name of the task template.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"TaskTemplateDescription\",\
          \"documentation\":\"<p>The description of the task template.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"TaskTemplateStatus\",\
          \"documentation\":\"<p>Marks a template as <code>ACTIVE</code> or <code>INACTIVE</code> for a task to refer to it. Tasks can only be created from <code>ACTIVE</code> templates. If a template is marked as <code>INACTIVE</code>, then a task that refers to this template cannot be created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp when the task template was last modified.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp when the task template was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about the task template.</p>\"\
    },\
    \"TaskTemplateName\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"TaskTemplateSingleSelectOption\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"TaskTemplateStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACTIVE\",\
        \"INACTIVE\"\
      ]\
    },\
    \"TelephonyConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"Distributions\"],\
      \"members\":{\
        \"Distributions\":{\
          \"shape\":\"DistributionList\",\
          \"documentation\":\"<p>Information about traffic distributions.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The distribution of traffic between the instance and its replicas.</p>\"\
    },\
    \"Threshold\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Comparison\":{\
          \"shape\":\"Comparison\",\
          \"documentation\":\"<p>The type of comparison. Only \\\"less than\\\" (LT) comparisons are supported.</p>\"\
        },\
        \"ThresholdValue\":{\
          \"shape\":\"ThresholdValue\",\
          \"documentation\":\"<p>The threshold value to compare.</p>\",\
          \"box\":true\
        }\
      },\
      \"documentation\":\"<p>Contains information about the threshold for service level metrics.</p>\"\
    },\
    \"ThresholdCollections\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ThresholdV2\"},\
      \"max\":1\
    },\
    \"ThresholdV2\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Comparison\":{\
          \"shape\":\"ResourceArnOrId\",\
          \"documentation\":\"<p>The type of comparison. Only \\\"less than\\\" (LT) comparisons are supported.</p>\"\
        },\
        \"ThresholdValue\":{\
          \"shape\":\"ThresholdValue\",\
          \"documentation\":\"<p>The threshold value to compare.</p>\",\
          \"box\":true\
        }\
      },\
      \"documentation\":\"<p>Contains information about the threshold for service level metrics.</p>\"\
    },\
    \"ThresholdValue\":{\"type\":\"double\"},\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>The throttling limit has been exceeded.</p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"TimeZone\":{\"type\":\"string\"},\
    \"TimerEligibleParticipantRoles\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CUSTOMER\",\
        \"AGENT\"\
      ]\
    },\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"TrafficDistributionGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TrafficDistributionGroupId\",\
          \"documentation\":\"<p>The identifier of the traffic distribution group. This can be the ID or the ARN if the API is being called in the Region where the traffic distribution group was created. The ARN must be provided if the call is from the replicated Region.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"TrafficDistributionGroupArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the traffic distribution group.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"Name128\",\
          \"documentation\":\"<p>The name of the traffic distribution group.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description250\",\
          \"documentation\":\"<p>The description of the traffic distribution group.</p>\"\
        },\
        \"InstanceArn\":{\
          \"shape\":\"InstanceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN).</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"TrafficDistributionGroupStatus\",\
          \"documentation\":\"<p>The status of the traffic distribution group.</p> <ul> <li> <p> <code>CREATION_IN_PROGRESS</code> means the previous <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_CreateTrafficDistributionGroup.html\\\">CreateTrafficDistributionGroup</a> operation is still in progress and has not yet completed.</p> </li> <li> <p> <code>ACTIVE</code> means the previous <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_CreateTrafficDistributionGroup.html\\\">CreateTrafficDistributionGroup</a> operation has succeeded.</p> </li> <li> <p> <code>CREATION_FAILED</code> indicates that the previous <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_CreateTrafficDistributionGroup.html\\\">CreateTrafficDistributionGroup</a> operation has failed.</p> </li> <li> <p> <code>PENDING_DELETION</code> means the previous <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_DeleteTrafficDistributionGroup.html\\\">DeleteTrafficDistributionGroup</a> operation is still in progress and has not yet completed.</p> </li> <li> <p> <code>DELETION_FAILED</code> means the previous <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_DeleteTrafficDistributionGroup.html\\\">DeleteTrafficDistributionGroup</a> operation has failed.</p> </li> <li> <p> <code>UPDATE_IN_PROGRESS</code> means the previous <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdateTrafficDistributionGroup.html\\\">UpdateTrafficDistributionGroup</a> operation is still in progress and has not yet completed.</p> </li> </ul>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        },\
        \"IsDefault\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether this is the default traffic distribution group created during instance replication. The default traffic distribution group cannot be deleted by the <code>DeleteTrafficDistributionGroup</code> API. The default traffic distribution group is deleted as part of the process for deleting a replica.</p> <note> <p>You can change the <code>SignInConfig</code> only for a default <code>TrafficDistributionGroup</code>. If you call <code>UpdateTrafficDistribution</code> with a modified <code>SignInConfig</code> and a non-default <code>TrafficDistributionGroup</code>, an <code>InvalidRequestException</code> is returned.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a traffic distribution group.</p>\"\
    },\
    \"TrafficDistributionGroupArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"^arn:(aws|aws-us-gov):connect:[a-z]{2}-[a-z]+-[0-9]{1}:[0-9]{1,20}:traffic-distribution-group/[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$\"\
    },\
    \"TrafficDistributionGroupId\":{\
      \"type\":\"string\",\
      \"pattern\":\"^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$\"\
    },\
    \"TrafficDistributionGroupIdOrArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"^(arn:(aws|aws-us-gov):connect:[a-z]{2}-[a-z-]+-[0-9]{1}:[0-9]{1,20}:traffic-distribution-group/)?[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$\"\
    },\
    \"TrafficDistributionGroupStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATION_IN_PROGRESS\",\
        \"ACTIVE\",\
        \"CREATION_FAILED\",\
        \"PENDING_DELETION\",\
        \"DELETION_FAILED\",\
        \"UPDATE_IN_PROGRESS\"\
      ]\
    },\
    \"TrafficDistributionGroupSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TrafficDistributionGroupId\",\
          \"documentation\":\"<p>The identifier of the traffic distribution group. This can be the ID or the ARN if the API is being called in the Region where the traffic distribution group was created. The ARN must be provided if the call is from the replicated Region.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"TrafficDistributionGroupArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the traffic distribution group.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"Name128\",\
          \"documentation\":\"<p>The name of the traffic distribution group.</p>\"\
        },\
        \"InstanceArn\":{\
          \"shape\":\"InstanceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the traffic distribution group.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"TrafficDistributionGroupStatus\",\
          \"documentation\":\"<p>The status of the traffic distribution group. </p> <ul> <li> <p> <code>CREATION_IN_PROGRESS</code> means the previous <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_CreateTrafficDistributionGroup.html\\\">CreateTrafficDistributionGroup</a> operation is still in progress and has not yet completed.</p> </li> <li> <p> <code>ACTIVE</code> means the previous <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_CreateTrafficDistributionGroup.html\\\">CreateTrafficDistributionGroup</a> operation has succeeded.</p> </li> <li> <p> <code>CREATION_FAILED</code> indicates that the previous <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_CreateTrafficDistributionGroup.html\\\">CreateTrafficDistributionGroup</a> operation has failed.</p> </li> <li> <p> <code>PENDING_DELETION</code> means the previous <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_DeleteTrafficDistributionGroup.html\\\">DeleteTrafficDistributionGroup</a> operation is still in progress and has not yet completed.</p> </li> <li> <p> <code>DELETION_FAILED</code> means the previous <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_DeleteTrafficDistributionGroup.html\\\">DeleteTrafficDistributionGroup</a> operation has failed.</p> </li> <li> <p> <code>UPDATE_IN_PROGRESS</code> means the previous <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_UpdateTrafficDistributionGroup.html\\\">UpdateTrafficDistributionGroup</a> operation is still in progress and has not yet completed.</p> </li> </ul>\"\
        },\
        \"IsDefault\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether this is the default traffic distribution group created during instance replication. The default traffic distribution group cannot be deleted by the <code>DeleteTrafficDistributionGroup</code> API. The default traffic distribution group is deleted as part of the process for deleting a replica.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about traffic distribution groups.</p>\"\
    },\
    \"TrafficDistributionGroupSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TrafficDistributionGroupSummary\"},\
      \"max\":10,\
      \"min\":0\
    },\
    \"TrafficDistributionGroupUserSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier for the user. This can be the ID or the ARN of the user.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary information about a traffic distribution group user.</p>\"\
    },\
    \"TrafficDistributionGroupUserSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TrafficDistributionGroupUserSummary\"},\
      \"max\":10,\
      \"min\":0\
    },\
    \"TrafficType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"GENERAL\",\
        \"CAMPAIGN\"\
      ]\
    },\
    \"TransferContactRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"ContactFlowId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact in this instance of Amazon Connect. </p>\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\"\
        },\
        \"UserId\":{\
          \"shape\":\"AgentResourceId\",\
          \"documentation\":\"<p>The identifier for the user. This can be the ID or the ARN of the user.</p>\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"TransferContactResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact in this instance of Amazon Connect. </p>\"\
        },\
        \"ContactArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the contact.</p>\"\
        }\
      }\
    },\
    \"URI\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1\
    },\
    \"Unit\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SECONDS\",\
        \"COUNT\",\
        \"PERCENT\"\
      ]\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceArn\",\
        \"tagKeys\"\
      ],\
      \"members\":{\
        \"resourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        },\
        \"tagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The tag keys.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"tagKeys\"\
        }\
      }\
    },\
    \"UpdateAgentStatusDescription\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":0\
    },\
    \"UpdateAgentStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"AgentStatusId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AgentStatusId\":{\
          \"shape\":\"AgentStatusId\",\
          \"documentation\":\"<p>The identifier of the agent status.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AgentStatusId\"\
        },\
        \"Name\":{\
          \"shape\":\"AgentStatusName\",\
          \"documentation\":\"<p>The name of the agent status.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"UpdateAgentStatusDescription\",\
          \"documentation\":\"<p>The description of the agent status.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"AgentStatusState\",\
          \"documentation\":\"<p>The state of the agent status.</p>\"\
        },\
        \"DisplayOrder\":{\
          \"shape\":\"AgentStatusOrderNumber\",\
          \"documentation\":\"<p>The display order of the agent status.</p>\",\
          \"box\":true\
        },\
        \"ResetOrderNumber\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>A number indicating the reset order of the agent status.</p>\"\
        }\
      }\
    },\
    \"UpdateContactAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InitialContactId\",\
        \"InstanceId\",\
        \"Attributes\"\
      ],\
      \"members\":{\
        \"InitialContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>The Amazon Connect attributes. These attributes can be accessed in flows just like any other contact attributes.</p> <p>You can have up to 32,768 UTF-8 bytes across all attributes for a contact. Attribute keys can include only alphanumeric, dash, and underscore characters.</p>\"\
        }\
      }\
    },\
    \"UpdateContactAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateContactEvaluationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"EvaluationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"EvaluationId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>A unique identifier for the contact evaluation.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EvaluationId\"\
        },\
        \"Answers\":{\
          \"shape\":\"EvaluationAnswersInputMap\",\
          \"documentation\":\"<p>A map of question identifiers to answer value.</p>\"\
        },\
        \"Notes\":{\
          \"shape\":\"EvaluationNotesMap\",\
          \"documentation\":\"<p>A map of question identifiers to note value.</p>\"\
        }\
      }\
    },\
    \"UpdateContactEvaluationResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EvaluationId\",\
        \"EvaluationArn\"\
      ],\
      \"members\":{\
        \"EvaluationId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>A unique identifier for the contact evaluation.</p>\"\
        },\
        \"EvaluationArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the contact evaluation resource.</p>\"\
        }\
      }\
    },\
    \"UpdateContactFlowContentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowId\",\
        \"Content\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactFlowId\"\
        },\
        \"Content\":{\
          \"shape\":\"ContactFlowContent\",\
          \"documentation\":\"<p>The JSON string that represents flow's content. For an example, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/flow-language-example.html\\\">Example contact flow in Amazon Connect Flow language</a>. </p>\"\
        }\
      }\
    },\
    \"UpdateContactFlowContentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateContactFlowMetadataRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactFlowId\"\
        },\
        \"Name\":{\
          \"shape\":\"ContactFlowName\",\
          \"documentation\":\"<p>The name of the flow.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ContactFlowDescription\",\
          \"documentation\":\"<p>The description of the flow.</p>\"\
        },\
        \"ContactFlowState\":{\
          \"shape\":\"ContactFlowState\",\
          \"documentation\":\"<p>The state of flow.</p>\"\
        }\
      }\
    },\
    \"UpdateContactFlowMetadataResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateContactFlowModuleContentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowModuleId\",\
        \"Content\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowModuleId\":{\
          \"shape\":\"ContactFlowModuleId\",\
          \"documentation\":\"<p>The identifier of the flow module.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactFlowModuleId\"\
        },\
        \"Content\":{\
          \"shape\":\"ContactFlowModuleContent\",\
          \"documentation\":\"<p>The content of the flow module.</p>\"\
        }\
      }\
    },\
    \"UpdateContactFlowModuleContentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateContactFlowModuleMetadataRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowModuleId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowModuleId\":{\
          \"shape\":\"ContactFlowModuleId\",\
          \"documentation\":\"<p>The identifier of the flow module.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactFlowModuleId\"\
        },\
        \"Name\":{\
          \"shape\":\"ContactFlowModuleName\",\
          \"documentation\":\"<p>The name of the flow module.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ContactFlowModuleDescription\",\
          \"documentation\":\"<p>The description of the flow module.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"ContactFlowModuleState\",\
          \"documentation\":\"<p>The state of flow module.</p>\"\
        }\
      }\
    },\
    \"UpdateContactFlowModuleMetadataResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateContactFlowNameRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactFlowId\"\
        },\
        \"Name\":{\
          \"shape\":\"ContactFlowName\",\
          \"documentation\":\"<p>The name of the flow.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ContactFlowDescription\",\
          \"documentation\":\"<p>The description of the flow.</p>\"\
        }\
      }\
    },\
    \"UpdateContactFlowNameResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateContactRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with your contact center.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactId\"\
        },\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of the contact.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the contact.</p>\"\
        },\
        \"References\":{\
          \"shape\":\"ContactReferences\",\
          \"documentation\":\"<p>Well-formed data on contact, shown to agents on Contact Control Panel (CCP).</p>\"\
        }\
      }\
    },\
    \"UpdateContactResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateContactScheduleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"ScheduledTime\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact.</p>\"\
        },\
        \"ScheduledTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp, in Unix Epoch seconds format, at which to start running the inbound flow. The scheduled time cannot be in the past. It must be within up to 6 days in future. </p>\"\
        }\
      }\
    },\
    \"UpdateContactScheduleResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateEvaluationFormRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"EvaluationFormId\",\
        \"EvaluationFormVersion\",\
        \"Title\",\
        \"Items\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"EvaluationFormId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The unique identifier for the evaluation form.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EvaluationFormId\"\
        },\
        \"EvaluationFormVersion\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>A version of the evaluation form to update.</p>\"\
        },\
        \"CreateNewVersion\":{\
          \"shape\":\"BoxedBoolean\",\
          \"documentation\":\"<p>A flag indicating whether the operation must create a new version.</p>\"\
        },\
        \"Title\":{\
          \"shape\":\"EvaluationFormTitle\",\
          \"documentation\":\"<p>A title of the evaluation form.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"EvaluationFormDescription\",\
          \"documentation\":\"<p>The description of the evaluation form.</p>\"\
        },\
        \"Items\":{\
          \"shape\":\"EvaluationFormItemsList\",\
          \"documentation\":\"<p>Items that are part of the evaluation form. The total number of sections and questions must not exceed 100 each. Questions must be contained in a section.</p>\"\
        },\
        \"ScoringStrategy\":{\
          \"shape\":\"EvaluationFormScoringStrategy\",\
          \"documentation\":\"<p>A scoring strategy of the evaluation form.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"UpdateEvaluationFormResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EvaluationFormId\",\
        \"EvaluationFormArn\",\
        \"EvaluationFormVersion\"\
      ],\
      \"members\":{\
        \"EvaluationFormId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The unique identifier for the evaluation form.</p>\"\
        },\
        \"EvaluationFormArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the contact evaluation resource.</p>\"\
        },\
        \"EvaluationFormVersion\":{\
          \"shape\":\"VersionNumber\",\
          \"documentation\":\"<p>The version of the updated evaluation form resource.</p>\"\
        }\
      }\
    },\
    \"UpdateHoursOfOperationDescription\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":0\
    },\
    \"UpdateHoursOfOperationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"HoursOfOperationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"HoursOfOperationId\":{\
          \"shape\":\"HoursOfOperationId\",\
          \"documentation\":\"<p>The identifier of the hours of operation.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"HoursOfOperationId\"\
        },\
        \"Name\":{\
          \"shape\":\"CommonNameLength127\",\
          \"documentation\":\"<p>The name of the hours of operation.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"UpdateHoursOfOperationDescription\",\
          \"documentation\":\"<p>The description of the hours of operation.</p>\"\
        },\
        \"TimeZone\":{\
          \"shape\":\"TimeZone\",\
          \"documentation\":\"<p>The time zone of the hours of operation.</p>\"\
        },\
        \"Config\":{\
          \"shape\":\"HoursOfOperationConfigList\",\
          \"documentation\":\"<p>Configuration information of the hours of operation.</p>\"\
        }\
      }\
    },\
    \"UpdateInstanceAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"AttributeType\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AttributeType\":{\
          \"shape\":\"InstanceAttributeType\",\
          \"documentation\":\"<p>The type of attribute.</p> <note> <p>Only allowlisted customers can consume USE_CUSTOM_TTS_VOICES. To access this feature, contact Amazon Web Services Support for allowlisting.</p> </note>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AttributeType\"\
        },\
        \"Value\":{\
          \"shape\":\"InstanceAttributeValue\",\
          \"documentation\":\"<p>The value for the attribute. Maximum character limit is 100. </p>\"\
        }\
      }\
    },\
    \"UpdateInstanceStorageConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"AssociationId\",\
        \"ResourceType\",\
        \"StorageConfig\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AssociationId\":{\
          \"shape\":\"AssociationId\",\
          \"documentation\":\"<p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AssociationId\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"InstanceStorageResourceType\",\
          \"documentation\":\"<p>A valid resource type.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resourceType\"\
        },\
        \"StorageConfig\":{\"shape\":\"InstanceStorageConfig\"}\
      }\
    },\
    \"UpdateParticipantRoleConfigChannelInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Chat\":{\
          \"shape\":\"ChatParticipantRoleConfig\",\
          \"documentation\":\"<p>Configuration information for the chat participant role.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information for the chat participant role.</p>\",\
      \"union\":true\
    },\
    \"UpdateParticipantRoleConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"ChannelConfiguration\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact in this instance of Amazon Connect. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactId\"\
        },\
        \"ChannelConfiguration\":{\
          \"shape\":\"UpdateParticipantRoleConfigChannelInfo\",\
          \"documentation\":\"<p>The Amazon Connect channel you want to configure.</p>\"\
        }\
      }\
    },\
    \"UpdateParticipantRoleConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdatePhoneNumberRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PhoneNumberId\",\
        \"TargetArn\"\
      ],\
      \"members\":{\
        \"PhoneNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>A unique identifier for the phone number.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"PhoneNumberId\"\
        },\
        \"TargetArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for Amazon Connect instances or traffic distribution groups that phone numbers are claimed to.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not provided, the Amazon Web Services SDK populates this field. For more information about idempotency, see <a href=\\\"https://aws.amazon.com/builders-library/making-retries-safe-with-idempotent-APIs/\\\">Making retries safe with idempotent APIs</a>.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"UpdatePhoneNumberResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PhoneNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>A unique identifier for the phone number.</p>\"\
        },\
        \"PhoneNumberArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the phone number.</p>\"\
        }\
      }\
    },\
    \"UpdatePromptRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"PromptId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"PromptId\":{\
          \"shape\":\"PromptId\",\
          \"documentation\":\"<p>A unique identifier for the prompt.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"PromptId\"\
        },\
        \"Name\":{\
          \"shape\":\"CommonNameLength127\",\
          \"documentation\":\"<p>The name of the prompt.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"PromptDescription\",\
          \"documentation\":\"<p>A description of the prompt.</p>\"\
        },\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The URI for the S3 bucket where the prompt is stored.</p>\"\
        }\
      }\
    },\
    \"UpdatePromptResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PromptARN\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the prompt.</p>\"\
        },\
        \"PromptId\":{\
          \"shape\":\"PromptId\",\
          \"documentation\":\"<p>A unique identifier for the prompt.</p>\"\
        }\
      }\
    },\
    \"UpdateQueueHoursOfOperationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\",\
        \"HoursOfOperationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        },\
        \"HoursOfOperationId\":{\
          \"shape\":\"HoursOfOperationId\",\
          \"documentation\":\"<p>The identifier for the hours of operation.</p>\"\
        }\
      }\
    },\
    \"UpdateQueueMaxContactsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        },\
        \"MaxContacts\":{\
          \"shape\":\"QueueMaxContacts\",\
          \"documentation\":\"<p>The maximum number of contacts that can be in the queue before it is considered full.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"UpdateQueueNameRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        },\
        \"Name\":{\
          \"shape\":\"CommonNameLength127\",\
          \"documentation\":\"<p>The name of the queue.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"QueueDescription\",\
          \"documentation\":\"<p>The description of the queue.</p>\"\
        }\
      }\
    },\
    \"UpdateQueueOutboundCallerConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\",\
        \"OutboundCallerConfig\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        },\
        \"OutboundCallerConfig\":{\
          \"shape\":\"OutboundCallerConfig\",\
          \"documentation\":\"<p>The outbound caller ID name, number, and outbound whisper flow.</p>\"\
        }\
      }\
    },\
    \"UpdateQueueStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\",\
        \"Status\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        },\
        \"Status\":{\
          \"shape\":\"QueueStatus\",\
          \"documentation\":\"<p>The status of the queue.</p>\"\
        }\
      }\
    },\
    \"UpdateQuickConnectConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QuickConnectId\",\
        \"QuickConnectConfig\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QuickConnectId\":{\
          \"shape\":\"QuickConnectId\",\
          \"documentation\":\"<p>The identifier for the quick connect.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QuickConnectId\"\
        },\
        \"QuickConnectConfig\":{\
          \"shape\":\"QuickConnectConfig\",\
          \"documentation\":\"<p>Information about the configuration settings for the quick connect.</p>\"\
        }\
      }\
    },\
    \"UpdateQuickConnectDescription\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":0\
    },\
    \"UpdateQuickConnectNameRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QuickConnectId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QuickConnectId\":{\
          \"shape\":\"QuickConnectId\",\
          \"documentation\":\"<p>The identifier for the quick connect.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QuickConnectId\"\
        },\
        \"Name\":{\
          \"shape\":\"QuickConnectName\",\
          \"documentation\":\"<p>The name of the quick connect.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"UpdateQuickConnectDescription\",\
          \"documentation\":\"<p>The description of the quick connect.</p>\"\
        }\
      }\
    },\
    \"UpdateRoutingProfileAgentAvailabilityTimerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RoutingProfileId\",\
        \"AgentAvailabilityTimer\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RoutingProfileId\"\
        },\
        \"AgentAvailabilityTimer\":{\
          \"shape\":\"AgentAvailabilityTimer\",\
          \"documentation\":\"<p>Whether agents with this routing profile will have their routing order calculated based on <i>time since their last inbound contact</i> or <i>longest idle time</i>. </p>\"\
        }\
      }\
    },\
    \"UpdateRoutingProfileConcurrencyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RoutingProfileId\",\
        \"MediaConcurrencies\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RoutingProfileId\"\
        },\
        \"MediaConcurrencies\":{\
          \"shape\":\"MediaConcurrencies\",\
          \"documentation\":\"<p>The channels that agents can handle in the Contact Control Panel (CCP).</p>\"\
        }\
      }\
    },\
    \"UpdateRoutingProfileDefaultOutboundQueueRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RoutingProfileId\",\
        \"DefaultOutboundQueueId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RoutingProfileId\"\
        },\
        \"DefaultOutboundQueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the default outbound queue.</p>\"\
        }\
      }\
    },\
    \"UpdateRoutingProfileNameRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RoutingProfileId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RoutingProfileId\"\
        },\
        \"Name\":{\
          \"shape\":\"RoutingProfileName\",\
          \"documentation\":\"<p>The name of the routing profile. Must not be more than 127 characters.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"RoutingProfileDescription\",\
          \"documentation\":\"<p>The description of the routing profile. Must not be more than 250 characters.</p>\"\
        }\
      }\
    },\
    \"UpdateRoutingProfileQueuesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RoutingProfileId\",\
        \"QueueConfigs\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RoutingProfileId\"\
        },\
        \"QueueConfigs\":{\
          \"shape\":\"RoutingProfileQueueConfigList\",\
          \"documentation\":\"<p>The queues to be updated for this routing profile. Queues must first be associated to the routing profile. You can do this using AssociateRoutingProfileQueues.</p>\"\
        }\
      }\
    },\
    \"UpdateRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RuleId\",\
        \"InstanceId\",\
        \"Name\",\
        \"Function\",\
        \"Actions\",\
        \"PublishStatus\"\
      ],\
      \"members\":{\
        \"RuleId\":{\
          \"shape\":\"RuleId\",\
          \"documentation\":\"<p>A unique identifier for the rule.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RuleId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"RuleName\",\
          \"documentation\":\"<p>The name of the rule. You can change the name only if <code>TriggerEventSource</code> is one of the following values: <code>OnZendeskTicketCreate</code> | <code>OnZendeskTicketStatusUpdate</code> | <code>OnSalesforceCaseCreate</code> </p>\"\
        },\
        \"Function\":{\
          \"shape\":\"RuleFunction\",\
          \"documentation\":\"<p>The conditions of the rule.</p>\"\
        },\
        \"Actions\":{\
          \"shape\":\"RuleActions\",\
          \"documentation\":\"<p>A list of actions to be run when the rule is triggered.</p>\"\
        },\
        \"PublishStatus\":{\
          \"shape\":\"RulePublishStatus\",\
          \"documentation\":\"<p>The publish status of the rule.</p>\"\
        }\
      }\
    },\
    \"UpdateSecurityProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SecurityProfileId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"Description\":{\
          \"shape\":\"SecurityProfileDescription\",\
          \"documentation\":\"<p>The description of the security profile.</p>\"\
        },\
        \"Permissions\":{\
          \"shape\":\"PermissionsList\",\
          \"documentation\":\"<p>The permissions granted to a security profile. For a list of valid permissions, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/security-profile-list.html\\\">List of security profile permissions</a>.</p>\"\
        },\
        \"SecurityProfileId\":{\
          \"shape\":\"SecurityProfileId\",\
          \"documentation\":\"<p>The identifier for the security profle.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"SecurityProfileId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AllowedAccessControlTags\":{\
          \"shape\":\"AllowedAccessControlTags\",\
          \"documentation\":\"<p>The list of tags that a security profile uses to restrict access to resources in Amazon Connect.</p>\"\
        },\
        \"TagRestrictedResources\":{\
          \"shape\":\"TagRestrictedResourceList\",\
          \"documentation\":\"<p>The list of resources that a security profile applies tag restrictions to in Amazon Connect.</p>\"\
        }\
      }\
    },\
    \"UpdateTaskTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TaskTemplateId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"TaskTemplateId\":{\
          \"shape\":\"TaskTemplateId\",\
          \"documentation\":\"<p>A unique identifier for the task template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TaskTemplateId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"TaskTemplateName\",\
          \"documentation\":\"<p>The name of the task template.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"TaskTemplateDescription\",\
          \"documentation\":\"<p>The description of the task template.</p>\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow that runs by default when a task is created by referencing this template.</p>\"\
        },\
        \"Constraints\":{\
          \"shape\":\"TaskTemplateConstraints\",\
          \"documentation\":\"<p>Constraints that are applicable to the fields listed.</p>\"\
        },\
        \"Defaults\":{\
          \"shape\":\"TaskTemplateDefaults\",\
          \"documentation\":\"<p>The default values for fields when a task is created by referencing this template.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"TaskTemplateStatus\",\
          \"documentation\":\"<p>Marks a template as <code>ACTIVE</code> or <code>INACTIVE</code> for a task to refer to it. Tasks can only be created from <code>ACTIVE</code> templates. If a template is marked as <code>INACTIVE</code>, then a task that refers to this template cannot be created.</p>\"\
        },\
        \"Fields\":{\
          \"shape\":\"TaskTemplateFields\",\
          \"documentation\":\"<p>Fields that are part of the template.</p>\"\
        }\
      }\
    },\
    \"UpdateTaskTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"TaskTemplateId\",\
          \"documentation\":\"<p>The identifier of the task template resource.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"TaskTemplateArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the task template resource.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"TaskTemplateName\",\
          \"documentation\":\"<p>The name of the task template.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"TaskTemplateDescription\",\
          \"documentation\":\"<p>The description of the task template.</p>\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow that runs by default when a task is created by referencing this template.</p>\"\
        },\
        \"Constraints\":{\
          \"shape\":\"TaskTemplateConstraints\",\
          \"documentation\":\"<p>Constraints that are applicable to the fields listed.</p>\"\
        },\
        \"Defaults\":{\
          \"shape\":\"TaskTemplateDefaults\",\
          \"documentation\":\"<p>The default values for fields when a task is created by referencing this template.</p>\"\
        },\
        \"Fields\":{\
          \"shape\":\"TaskTemplateFields\",\
          \"documentation\":\"<p>Fields that are part of the template.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"TaskTemplateStatus\",\
          \"documentation\":\"<p>Marks a template as <code>ACTIVE</code> or <code>INACTIVE</code> for a task to refer to it. Tasks can only be created from <code>ACTIVE</code> templates. If a template is marked as <code>INACTIVE</code>, then a task that refers to this template cannot be created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp when the task template was last modified.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp when the task template was created.</p>\"\
        }\
      }\
    },\
    \"UpdateTrafficDistributionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"TrafficDistributionGroupIdOrArn\",\
          \"documentation\":\"<p>The identifier of the traffic distribution group. This can be the ID or the ARN if the API is being called in the Region where the traffic distribution group was created. The ARN must be provided if the call is from the replicated Region.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Id\"\
        },\
        \"TelephonyConfig\":{\
          \"shape\":\"TelephonyConfig\",\
          \"documentation\":\"<p>The distribution of traffic between the instance and its replica(s).</p>\"\
        },\
        \"SignInConfig\":{\
          \"shape\":\"SignInConfig\",\
          \"documentation\":\"<p>The distribution of allowing signing in to the instance and its replica(s).</p>\"\
        },\
        \"AgentConfig\":{\
          \"shape\":\"AgentConfig\",\
          \"documentation\":\"<p>The distribution of agents between the instance and its replica(s).</p>\"\
        }\
      }\
    },\
    \"UpdateTrafficDistributionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateUserHierarchyGroupNameRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"HierarchyGroupId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"HierarchyGroupName\",\
          \"documentation\":\"<p>The name of the hierarchy group. Must not be more than 100 characters.</p>\"\
        },\
        \"HierarchyGroupId\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the hierarchy group.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"HierarchyGroupId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"UpdateUserHierarchyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"HierarchyGroupId\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the hierarchy group.</p>\"\
        },\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"UpdateUserHierarchyStructureRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HierarchyStructure\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"HierarchyStructure\":{\
          \"shape\":\"HierarchyStructureUpdate\",\
          \"documentation\":\"<p>The hierarchy levels to update.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"UpdateUserIdentityInfoRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityInfo\",\
        \"UserId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"IdentityInfo\":{\
          \"shape\":\"UserIdentityInfo\",\
          \"documentation\":\"<p>The identity information for the user.</p>\"\
        },\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"UpdateUserPhoneConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PhoneConfig\",\
        \"UserId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"PhoneConfig\":{\
          \"shape\":\"UserPhoneConfig\",\
          \"documentation\":\"<p>Information about phone configuration settings for the user.</p>\"\
        },\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"UpdateUserRoutingProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RoutingProfileId\",\
        \"UserId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile for the user.</p>\"\
        },\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"UpdateUserSecurityProfilesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SecurityProfileIds\",\
        \"UserId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"SecurityProfileIds\":{\
          \"shape\":\"SecurityProfileIds\",\
          \"documentation\":\"<p>The identifiers of the security profiles for the user.</p>\"\
        },\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html\\\">find the instance ID</a> in the Amazon Resource Name (ARN) of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"Url\":{\"type\":\"string\"},\
    \"UrlReference\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ReferenceKey\",\
          \"documentation\":\"<p>Identifier of the URL reference.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"ReferenceValue\",\
          \"documentation\":\"<p>A valid URL.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The URL reference.</p>\"\
    },\
    \"UseCase\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UseCaseId\":{\
          \"shape\":\"UseCaseId\",\
          \"documentation\":\"<p>The identifier for the use case.</p>\"\
        },\
        \"UseCaseArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the use case.</p>\"\
        },\
        \"UseCaseType\":{\
          \"shape\":\"UseCaseType\",\
          \"documentation\":\"<p>The type of use case to associate to the integration association. Each integration association can have only one of each use case type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the use case.</p>\"\
    },\
    \"UseCaseId\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1\
    },\
    \"UseCaseSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UseCase\"}\
    },\
    \"UseCaseType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RULES_EVALUATION\",\
        \"CONNECT_CAMPAIGNS\"\
      ]\
    },\
    \"User\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user account.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"AgentUsername\",\
          \"documentation\":\"<p>The user name assigned to the user account.</p>\"\
        },\
        \"IdentityInfo\":{\
          \"shape\":\"UserIdentityInfo\",\
          \"documentation\":\"<p>Information about the user identity.</p>\"\
        },\
        \"PhoneConfig\":{\
          \"shape\":\"UserPhoneConfig\",\
          \"documentation\":\"<p>Information about the phone configuration for the user.</p>\"\
        },\
        \"DirectoryUserId\":{\
          \"shape\":\"DirectoryUserId\",\
          \"documentation\":\"<p>The identifier of the user account in the directory used for identity management.</p>\"\
        },\
        \"SecurityProfileIds\":{\
          \"shape\":\"SecurityProfileIds\",\
          \"documentation\":\"<p>The identifiers of the security profiles for the user.</p>\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile for the user.</p>\"\
        },\
        \"HierarchyGroupId\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the hierarchy group for the user.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a user account for an Amazon Connect instance.</p>\"\
    },\
    \"UserData\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"User\":{\
          \"shape\":\"UserReference\",\
          \"documentation\":\"<p>Information about the user for the data that is returned. It contains the <code>resourceId</code> and ARN of the user. </p>\"\
        },\
        \"RoutingProfile\":{\
          \"shape\":\"RoutingProfileReference\",\
          \"documentation\":\"<p>Information about the routing profile that is assigned to the user.</p>\"\
        },\
        \"HierarchyPath\":{\
          \"shape\":\"HierarchyPathReference\",\
          \"documentation\":\"<p>Contains information about the levels of a hierarchy group assigned to a user.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"AgentStatusReference\",\
          \"documentation\":\"<p>The status of the agent that they manually set in their Contact Control Panel (CCP), or that the supervisor manually changes in the real-time metrics report.</p>\"\
        },\
        \"AvailableSlotsByChannel\":{\
          \"shape\":\"ChannelToCountMap\",\
          \"documentation\":\"<p>A map of available slots by channel. The key is a channel name. The value is an integer: the available number of slots. </p>\"\
        },\
        \"MaxSlotsByChannel\":{\
          \"shape\":\"ChannelToCountMap\",\
          \"documentation\":\"<p>A map of maximum slots by channel. The key is a channel name. The value is an integer: the maximum number of slots. This is calculated from <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_MediaConcurrency.html\\\">MediaConcurrency</a> of the <code>RoutingProfile</code> assigned to the agent. </p>\"\
        },\
        \"ActiveSlotsByChannel\":{\
          \"shape\":\"ChannelToCountMap\",\
          \"documentation\":\"<p> A map of active slots by channel. The key is a channel name. The value is an integer: the number of active slots. </p>\"\
        },\
        \"Contacts\":{\
          \"shape\":\"AgentContactReferenceList\",\
          \"documentation\":\"<p>A list of contact reference information.</p>\"\
        },\
        \"NextStatus\":{\
          \"shape\":\"AgentStatusName\",\
          \"documentation\":\"<p>The Next status of the agent.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Data for a user.</p>\"\
    },\
    \"UserDataFilters\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Queues\":{\
          \"shape\":\"Queues\",\
          \"documentation\":\"<p>A list of up to 100 queues or ARNs.</p>\"\
        },\
        \"ContactFilter\":{\
          \"shape\":\"ContactFilter\",\
          \"documentation\":\"<p>A filter for the user data based on the contact information that is associated to the user. It contains a list of contact states. </p>\"\
        },\
        \"RoutingProfiles\":{\
          \"shape\":\"RoutingProfiles\",\
          \"documentation\":\"<p>A list of up to 100 routing profile IDs or ARNs.</p>\"\
        },\
        \"Agents\":{\
          \"shape\":\"AgentsMinOneMaxHundred\",\
          \"documentation\":\"<p>A list of up to 100 agent IDs or ARNs.</p>\"\
        },\
        \"UserHierarchyGroups\":{\
          \"shape\":\"UserDataHierarchyGroups\",\
          \"documentation\":\"<p>A UserHierarchyGroup ID or ARN.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A filter for the user data.</p>\"\
    },\
    \"UserDataHierarchyGroups\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HierarchyGroupId\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"UserDataList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserData\"}\
    },\
    \"UserId\":{\"type\":\"string\"},\
    \"UserIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserId\"}\
    },\
    \"UserIdentityInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FirstName\":{\
          \"shape\":\"AgentFirstName\",\
          \"documentation\":\"<p>The first name. This is required if you are using Amazon Connect or SAML for identity management.</p>\"\
        },\
        \"LastName\":{\
          \"shape\":\"AgentLastName\",\
          \"documentation\":\"<p>The last name. This is required if you are using Amazon Connect or SAML for identity management.</p>\"\
        },\
        \"Email\":{\
          \"shape\":\"Email\",\
          \"documentation\":\"<p>The email address. If you are using SAML for identity management and include this parameter, an error is returned.</p>\"\
        },\
        \"SecondaryEmail\":{\
          \"shape\":\"Email\",\
          \"documentation\":\"<p>The user's secondary email address. If you provide a secondary email, the user receives email notifications - other than password reset notifications - to this email address instead of to their primary email address.</p> <p>Pattern: <code>(?=^.{0,265}$)[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\\\.[a-zA-Z]{2,63}</code> </p>\"\
        },\
        \"Mobile\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The user's mobile number.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the identity of a user.</p>\"\
    },\
    \"UserIdentityInfoLite\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FirstName\":{\
          \"shape\":\"AgentFirstName\",\
          \"documentation\":\"<p>The user's first name.</p>\"\
        },\
        \"LastName\":{\
          \"shape\":\"AgentLastName\",\
          \"documentation\":\"<p>The user's last name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The user's first name and last name.</p>\"\
    },\
    \"UserNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>No user with the specified credentials was found in the Amazon Connect instance.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"UserPhoneConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"PhoneType\"],\
      \"members\":{\
        \"PhoneType\":{\
          \"shape\":\"PhoneType\",\
          \"documentation\":\"<p>The phone type.</p>\"\
        },\
        \"AutoAccept\":{\
          \"shape\":\"AutoAccept\",\
          \"documentation\":\"<p>The Auto accept setting.</p>\"\
        },\
        \"AfterContactWorkTimeLimit\":{\
          \"shape\":\"AfterContactWorkTimeLimit\",\
          \"documentation\":\"<p>The After Call Work (ACW) timeout setting, in seconds.</p> <note> <p>When returned by a <code>SearchUsers</code> call, <code>AfterContactWorkTimeLimit</code> is returned in milliseconds. </p> </note>\"\
        },\
        \"DeskPhoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number for the user's desk phone.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the phone configuration settings for a user.</p>\"\
    },\
    \"UserQuickConnectConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserId\",\
        \"ContactFlowId\"\
      ],\
      \"members\":{\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user.</p>\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the flow.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the quick connect configuration settings for a user. The contact flow must be of type Transfer to Agent.</p>\"\
    },\
    \"UserReference\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The unique identifier for the user.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the user.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the user.</p>\"\
    },\
    \"UserSearchConditionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserSearchCriteria\"}\
    },\
    \"UserSearchCriteria\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OrConditions\":{\
          \"shape\":\"UserSearchConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an <code>OR</code> condition.</p>\"\
        },\
        \"AndConditions\":{\
          \"shape\":\"UserSearchConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an <code>AND</code> condition. </p>\"\
        },\
        \"StringCondition\":{\
          \"shape\":\"StringCondition\",\
          \"documentation\":\"<p>A leaf node condition which can be used to specify a string condition.</p> <note> <p>The currently supported values for <code>FieldName</code> are <code>name</code>, <code>description</code>, and <code>resourceID</code>.</p> </note>\"\
        },\
        \"HierarchyGroupCondition\":{\
          \"shape\":\"HierarchyGroupCondition\",\
          \"documentation\":\"<p>A leaf node condition which can be used to specify a hierarchy group condition.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The search criteria to be used to return users.</p> <note> <p>The <code>name</code> and <code>description</code> fields support \\\"contains\\\" queries with a minimum of 2 characters and a maximum of 25 characters. Any queries with character lengths outside of this range will throw invalid results. </p> </note>\"\
    },\
    \"UserSearchFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TagFilter\":{\"shape\":\"ControlPlaneTagFilter\"}\
      },\
      \"documentation\":\"<p>Filters to be applied to search results.</p>\"\
    },\
    \"UserSearchSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user.</p>\"\
        },\
        \"DirectoryUserId\":{\
          \"shape\":\"DirectoryUserId\",\
          \"documentation\":\"<p>The directory identifier of the user.</p>\"\
        },\
        \"HierarchyGroupId\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the user's hierarchy group.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user's summary.</p>\"\
        },\
        \"IdentityInfo\":{\
          \"shape\":\"UserIdentityInfoLite\",\
          \"documentation\":\"<p>The user's first name and last name.</p>\"\
        },\
        \"PhoneConfig\":{\"shape\":\"UserPhoneConfig\"},\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the user's routing profile.</p>\"\
        },\
        \"SecurityProfileIds\":{\
          \"shape\":\"SecurityProfileIds\",\
          \"documentation\":\"<p>The identifiers of the user's security profiles.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"AgentUsername\",\
          \"documentation\":\"<p>The name of the user.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the returned users.</p>\"\
    },\
    \"UserSearchSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserSearchSummary\"}\
    },\
    \"UserSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user account.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"AgentUsername\",\
          \"documentation\":\"<p>The Amazon Connect user name of the user account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a user.</p>\"\
    },\
    \"UserSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserSummary\"}\
    },\
    \"UserTagMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"String\"},\
      \"value\":{\"shape\":\"String\"}\
    },\
    \"Value\":{\"type\":\"double\"},\
    \"VersionNumber\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"min\":1\
    },\
    \"Vocabulary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Id\",\
        \"Arn\",\
        \"LanguageCode\",\
        \"State\",\
        \"LastModifiedTime\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>A unique name of the custom vocabulary.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"VocabularyId\",\
          \"documentation\":\"<p>The identifier of the custom vocabulary.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the custom vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"VocabularyLanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html\\\">What is Amazon Transcribe?</a> </p>\"\
        },\
        \"State\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The current state of the custom vocabulary.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"VocabularyLastModifiedTime\",\
          \"documentation\":\"<p>The timestamp when the custom vocabulary was last modified.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"VocabularyFailureReason\",\
          \"documentation\":\"<p>The reason why the custom vocabulary was not created.</p>\"\
        },\
        \"Content\":{\
          \"shape\":\"VocabularyContent\",\
          \"documentation\":\"<p>The content of the custom vocabulary in plain-text format with a table of values. Each row in the table represents a word or a phrase, described with <code>Phrase</code>, <code>IPA</code>, <code>SoundsLike</code>, and <code>DisplayAs</code> fields. Separate the fields with TAB characters. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html#create-vocabulary-table\\\">Create a custom vocabulary using a table</a>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a custom vocabulary.</p>\"\
    },\
    \"VocabularyContent\":{\
      \"type\":\"string\",\
      \"max\":60000,\
      \"min\":1\
    },\
    \"VocabularyFailureReason\":{\"type\":\"string\"},\
    \"VocabularyId\":{\
      \"type\":\"string\",\
      \"max\":500,\
      \"min\":1\
    },\
    \"VocabularyLanguageCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ar-AE\",\
        \"de-CH\",\
        \"de-DE\",\
        \"en-AB\",\
        \"en-AU\",\
        \"en-GB\",\
        \"en-IE\",\
        \"en-IN\",\
        \"en-US\",\
        \"en-WL\",\
        \"es-ES\",\
        \"es-US\",\
        \"fr-CA\",\
        \"fr-FR\",\
        \"hi-IN\",\
        \"it-IT\",\
        \"ja-JP\",\
        \"ko-KR\",\
        \"pt-BR\",\
        \"pt-PT\",\
        \"zh-CN\",\
        \"en-NZ\",\
        \"en-ZA\"\
      ]\
    },\
    \"VocabularyLastModifiedTime\":{\"type\":\"timestamp\"},\
    \"VocabularyName\":{\
      \"type\":\"string\",\
      \"max\":140,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"VocabularyNextToken\":{\
      \"type\":\"string\",\
      \"max\":131070,\
      \"min\":1,\
      \"pattern\":\".*\\\\S.*\"\
    },\
    \"VocabularyState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATION_IN_PROGRESS\",\
        \"ACTIVE\",\
        \"CREATION_FAILED\",\
        \"DELETE_IN_PROGRESS\"\
      ]\
    },\
    \"VocabularySummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Id\",\
        \"Arn\",\
        \"LanguageCode\",\
        \"State\",\
        \"LastModifiedTime\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>A unique name of the custom vocabulary.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"VocabularyId\",\
          \"documentation\":\"<p>The identifier of the custom vocabulary.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the custom vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"VocabularyLanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html\\\">What is Amazon Transcribe?</a> </p>\"\
        },\
        \"State\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The current state of the custom vocabulary.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"VocabularyLastModifiedTime\",\
          \"documentation\":\"<p>The timestamp when the custom vocabulary was last modified.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"VocabularyFailureReason\",\
          \"documentation\":\"<p>The reason why the custom vocabulary was not created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about the custom vocabulary.</p>\"\
    },\
    \"VocabularySummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VocabularySummary\"}\
    },\
    \"VoiceRecordingConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VoiceRecordingTrack\":{\
          \"shape\":\"VoiceRecordingTrack\",\
          \"documentation\":\"<p>Identifies which track is being recorded.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the recording configuration settings.</p>\"\
    },\
    \"VoiceRecordingTrack\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FROM_AGENT\",\
        \"TO_AGENT\",\
        \"ALL\"\
      ]\
    },\
    \"WisdomInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SessionArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Wisdom session.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about Amazon Connect Wisdom.</p>\"\
    },\
    \"timestamp\":{\"type\":\"timestamp\"}\
  },\
  \"documentation\":\"<p>Amazon Connect is a cloud-based contact center solution that you use to set up and manage a customer contact center and provide reliable customer engagement at any scale.</p> <p>Amazon Connect provides metrics and real-time reporting that enable you to optimize contact routing. You can also resolve customer issues more efficiently by getting customers in touch with the appropriate agents.</p> <p>There are limits to the number of Amazon Connect resources that you can create. There are also limits to the number of requests that you can make per second. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html\\\">Amazon Connect Service Quotas</a> in the <i>Amazon Connect Administrator Guide</i>.</p> <p>You can connect programmatically to an Amazon Web Services service by using an endpoint. For a list of Amazon Connect endpoints, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/connect_region.html\\\">Amazon Connect Endpoints</a>.</p>\"\
}\
";
}

@end