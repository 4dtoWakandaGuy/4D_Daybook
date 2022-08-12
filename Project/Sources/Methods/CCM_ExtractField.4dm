//%attributes = {}

If (False:C215)
	//Project Method Name:      CCM_ExtractField
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CCM_at_ResponseFieldName;0)
	C_BOOLEAN:C305($_bo_USXMLDOM)
	C_LONGINT:C283($_l_DelimiterPosition; $_l_DelmiterPosition; $_l_Index; $_l_ResponseFieldPosition; $_l_Type; $5)
	C_POINTER:C301($6)
	C_TEXT:C284($_t_Delimiter; $_t_ElementValue; $_t_FieldName; $_t_InputText; $_t_NulString; $_t_oldMethodName; $_t_String; $_t_SubReference; $_t_SubReference2; $_t_SubReference3; $_t_SubReference4)
	C_TEXT:C284($_t_TransactionType; $_t_XMLREference; $_t_XMLReferenceName; $0; $1; $2; $3; $4)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("CCM_ExtractField")

// (4) ` Method Name: CCM_ExtractField(Changed to)$_bo_USXMLDOM:=False
// (19)$_t_Delimiter:=$4(Changed to)$_bo_USXMLDOM:=True

// Block of lines edited from line 137to line 153

// Nigel Greenlee12/4/2012 16:56 v7.0.0/1
// Edited
// (126)Else (Changed to)ARRAY TEXT($nodeRefsArr;0)
// (127)$_t_String:=""(Changed to)ARRAY TEXT($childTypesArr;0)
// (129)$_t_InputText:=Substring($_t_InputText;$pos+1;Length($_t_InputText))(Changed to)$BodyFound:=False
// (134)End for (Changed to)$BodyFound:=True
// (192)(Changed to)End if 



// Nigel Greenlee13/4/2012 12:07 v7.0.0/1
// Edited
// (125)If ($_l_ResponseFieldPosition<1) ` check that(Changed to)$XMLREF:=DOM Parse XML variable($XMLDOM)
// (127)Else (Changed to)ARRAY LONGINT($childTypesArr;0)


// End Project method Amendments
//End if 

// CCM_ExtractField 
$_bo_USXMLDOM:=False:C215
If (Count parameters:C259>=3)
	If (Count parameters:C259>=4)
		$_t_Delimiter:=$4
	Else 
		Case of 
			: ($1="Authorize Net")
				$_t_Delimiter:="|"
			: ($1="Transax")
				$_t_Delimiter:=","
				$_l_DelmiterPosition:=Position:C15($_t_Delimiter; $3)
				If ($_l_DelmiterPosition=0)
					$_t_Delimiter:="|"
				End if 
			: ($1="Paypal")
				$_bo_USXMLDOM:=True:C214
		End case 
		
	End if 
	$_t_InputText:=$3
	$_t_String:=""
	Case of 
		: ($1="Authorize Net")
			CCMAuthorizenetDefinitions
			$_l_ResponseFieldPosition:=Find in array:C230(CCM_at_ResponseFieldName; $2)
			If ($_l_ResponseFieldPosition<1)  // check that
				$_l_ResponseFieldPosition:=$_l_ResponseFieldPosition*2
			Else 
				$_l_ResponseFieldPosition:=$_l_ResponseFieldPosition
			End if 
			For ($_l_Index; 1; $_l_ResponseFieldPosition)
				$_l_DelmiterPosition:=Position:C15($_t_Delimiter; $_t_InputText)
				If ($_l_DelmiterPosition>0)
					If ($_l_DelmiterPosition>1)
						$_t_String:=Substring:C12($_t_InputText; 1; $_l_DelmiterPosition-1)
					Else 
						$_t_String:=""
					End if 
					$_t_InputText:=Substring:C12($_t_InputText; $_l_DelmiterPosition+1; Length:C16($_t_InputText))
					
					
				End if 
				
			End for 
			$0:=$_t_String
			
		: ($1="Transax")
			
			
			If (Count parameters:C259<5)
				$_l_Type:=1
			Else 
				$_l_Type:=$5
			End if 
			Case of 
				: ($_l_Type=1)  // get frm response Respone
					If (Count parameters:C259<6)
						CCMTransaxDefinitions
						$_l_ResponseFieldPosition:=Find in array:C230(CCM_at_ResponseFieldName; $2)
						If ($_l_ResponseFieldPosition<1)  // check that
							$_l_ResponseFieldPosition:=$_l_ResponseFieldPosition*2
						Else 
							$_l_ResponseFieldPosition:=$_l_ResponseFieldPosition
						End if 
						For ($_l_Index; 1; $_l_ResponseFieldPosition)
							$_l_DelmiterPosition:=Position:C15($_t_Delimiter; $_t_InputText)
							If ($_l_DelmiterPosition>0)
								If ($_l_DelmiterPosition>1)
									$_t_String:=Substring:C12($_t_InputText; 1; $_l_DelmiterPosition-1)
								Else 
									$_t_String:=""
								End if 
								$_t_InputText:=Substring:C12($_t_InputText; $_l_DelmiterPosition+1; Length:C16($_t_InputText))
								
								
							End if 
							
						End for 
						$0:=$_t_String
					Else 
						$0:=CCM_GetTransaxField($6; $_l_Type; $2)
						
						
					End if 
				: ($_l_Type=2)
					If (Count parameters:C259<6)
						
						CCMTransaxDefinitionsSending
						$_l_ResponseFieldPosition:=Find in array:C230(CCM_at_ResponseFieldName; $2)
						If ($_l_ResponseFieldPosition<1)  // check that
							$_l_ResponseFieldPosition:=$_l_ResponseFieldPosition*2
						Else 
							$_l_ResponseFieldPosition:=$_l_ResponseFieldPosition
						End if 
						For ($_l_Index; 1; $_l_ResponseFieldPosition)
							$_l_DelmiterPosition:=Position:C15($_t_Delimiter; $_t_InputText)
							If ($_l_DelmiterPosition>0)
								If ($_l_DelmiterPosition>1)
									$_t_String:=Substring:C12($_t_InputText; 1; $_l_DelmiterPosition-1)
								Else 
									$_t_String:=""
								End if 
								$_t_InputText:=Substring:C12($_t_InputText; $_l_DelmiterPosition+1; Length:C16($_t_InputText))
								
								
							End if 
							
						End for 
						$0:=$_t_String
						
					Else 
						$0:=CCM_GetTransaxField($6; $_l_Type; $2)
					End if 
					
			End case 
			
		: ($1="Paypal")
			If ($3#"")
				//The basic response if not an error is all at 'one' level
				$_t_XMLREference:=DOM Parse XML variable:C720($3)
				If (Count parameters:C259>=4)
					$_t_TransactionType:=$4
				Else 
					$_t_TransactionType:="DoDirectResponse"
				End if 
				If ($_t_XMLREference#"")
					Case of 
						: ($_t_TransactionType="DoCapture@")
							//`TRACE
							$_t_NulString:="0"*16
							$_t_FieldName:=$2
							If ($_t_FieldName="Amount")
								$_t_FieldName:="Gross Amount"
							End if 
							//DoCaptureResponseDetails
							$_t_SubReference:=DOM Get first child XML element:C723($_t_XMLREference; $_t_XMLReferenceName)
							$_t_SubReference2:=DOM Find XML element:C864($_t_XMLREference; "DoCaptureResponse/Ack")
							If ($_t_SubReference2#$_t_NulString)  //This is from the basic response
								$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "DoCaptureResponse/DoCaptureResponseDetails/PaymentInfo/"+$2)
								If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
									//`$_t_SubReference4:=DOM Find XML element($_t_SubReference3;$2)
									DOM GET XML ELEMENT VALUE:C731($_t_SubReference3; $_t_ElementValue)
								Else 
									//we should only be here is we are parsing an error response
									$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "DoCaptureResponse/Errors")
									If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
										$_t_SubReference4:=DOM Find XML element:C864($_t_XMLREference; "DoCaptureResponse/Errors/"+$_t_FieldName)
										DOM GET XML ELEMENT VALUE:C731($_t_SubReference4; $_t_ElementValue)
									End if 
								End if 
								$0:=$_t_ElementValue
							Else 
								//look for the more detailed date path
								
							End if 
							
						: ($_t_TransactionType="DoRefund@")
							$_t_NulString:="0"*16
							$_t_ElementValue:=""
							$_t_SubReference:=DOM Get first child XML element:C723($_t_XMLREference; $_t_XMLReferenceName)
							$_t_SubReference2:=DOM Find XML element:C864($_t_XMLREference; "RefundTransactionResponse/Ack")
							If ($_t_SubReference2#$_t_NulString)  //This is from the basic response
								If ($2="TransactionID")
									$_t_FieldName:="RefundTransactionID"
								Else 
									If ($2="Amount")
										$_t_FieldName:="TotalRefundedAmount"
									Else 
										$_t_FieldName:=$2
									End if 
								End if 
								
								$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "RefundTransactionResponse/"+$_t_FieldName)
								If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
									DOM GET XML ELEMENT VALUE:C731($_t_SubReference3; $_t_ElementValue)
								Else 
									$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "RefundTransactionResponse/RefundInfo")
									$_t_SubReference4:=DOM Find XML element:C864($_t_XMLREference; "RefundTransactionResponse/RefundInfo/"+$_t_FieldName)
									If ($_t_SubReference4#$_t_NulString)  //This is from the basic response
										DOM GET XML ELEMENT VALUE:C731($_t_SubReference4; $_t_ElementValue)
									Else 
										//we should only be here is we are parsing an error response
										$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "RefundTransactionResponse/Errors")
										If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
											$_t_SubReference4:=DOM Find XML element:C864($_t_XMLREference; "RefundTransactionResponse/Errors/"+$0)
											DOM GET XML ELEMENT VALUE:C731($_t_SubReference4; $_t_ElementValue)
										End if 
									End if 
								End if 
								$0:=$_t_ElementValue
							Else 
								//look for the more detailed date path
								
							End if 
							
						: ($_t_TransactionType="DoVoid@")
							$_t_NulString:="0"*16
							$_t_SubReference:=DOM Get first child XML element:C723($_t_XMLREference; $_t_XMLReferenceName)
							$_t_SubReference2:=DOM Find XML element:C864($_t_XMLREference; "DoVoidResponse/Ack")
							If ($_t_SubReference2#$_t_NulString)  //This is from the basic response
								$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "DoVoidResponse/"+$2)
								If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
									DOM GET XML ELEMENT VALUE:C731($_t_SubReference3; $_t_ElementValue)
								Else 
									//we should only be here is we are parsing an error response
									$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "DoVoidResponse/Errors")
									If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
										$_t_SubReference4:=DOM Find XML element:C864($_t_XMLREference; "DoVoidResponse/Errors/"+$2)
										DOM GET XML ELEMENT VALUE:C731($_t_SubReference4; $_t_ElementValue)
									End if 
								End if 
								$0:=$_t_ElementValue
							Else 
								//look for the more detailed date path
								
							End if 
						: ($_t_TransactionType="DoDirect@")
							$_t_NulString:="0"*16
							$_t_SubReference:=DOM Get first child XML element:C723($_t_XMLREference; $_t_XMLReferenceName)
							$_t_SubReference2:=DOM Find XML element:C864($_t_XMLREference; "DoDirectPaymentResponse/Ack")
							If ($_t_SubReference2#$_t_NulString)  //This is from the basic response
								$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "DoDirectPaymentResponse/"+$2)
								If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
									DOM GET XML ELEMENT VALUE:C731($_t_SubReference3; $_t_ElementValue)
								Else 
									//we should only be here is we are parsing an error response
									$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "DoDirectPaymentResponse/Errors")
									If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
										$_t_SubReference4:=DOM Find XML element:C864($_t_XMLREference; "DoDirectPaymentResponse/Errors/"+$2)
										DOM GET XML ELEMENT VALUE:C731($_t_SubReference4; $_t_ElementValue)
									End if 
								End if 
								$0:=$_t_ElementValue
							Else 
								//look for the more detailed date path
								
							End if 
						: ($_t_TransactionType="Transaction")
							$_t_ElementValue:=""
							$0:=$_t_ElementValue
							$_t_NulString:="0"*16
							$_t_SubReference:=DOM Get first child XML element:C723($_t_XMLREference; $_t_XMLReferenceName)
							$_t_SubReference2:=DOM Find XML element:C864($_t_XMLREference; "GetTransactionDetailsResponse/Ack")
							If ($_t_SubReference2#$_t_NulString)
								$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "GetTransactionDetailsResponse/"+$2)
								If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
									DOM GET XML ELEMENT VALUE:C731($_t_SubReference3; $_t_ElementValue)
								Else 
									$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "GetTransactionDetailsResponse/PaymentTransactionDetails/"+$2)
									If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
										DOM GET XML ELEMENT VALUE:C731($_t_SubReference3; $_t_ElementValue)
										//we should only be here is we are parsing an error response
									Else 
										$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "GetTransactionDetailsResponse/PaymentTransactionDetails/ReceiverInfo/"+$2)
										If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
											DOM GET XML ELEMENT VALUE:C731($_t_SubReference3; $_t_ElementValue)
										Else 
											$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "GetTransactionDetailsResponse/PaymentTransactionDetails/PayerInfo/"+$2)
											If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
												DOM GET XML ELEMENT VALUE:C731($_t_SubReference3; $_t_ElementValue)
											Else 
												$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "GetTransactionDetailsResponse/PaymentTransactionDetails/PayerInfo/PayerName/"+$2)
												If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
													DOM GET XML ELEMENT VALUE:C731($_t_SubReference3; $_t_ElementValue)
												Else 
													$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "GetTransactionDetailsResponse/PaymentTransactionDetails/PayerInfo/Address"+$2)
													If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
														DOM GET XML ELEMENT VALUE:C731($_t_SubReference3; $_t_ElementValue)
													Else 
														$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "GetTransactionDetailsResponse/PaymentTransactionDetails/PayerInfo/Address/AddressOwner/"+$2)
														If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
															DOM GET XML ELEMENT VALUE:C731($_t_SubReference3; $_t_ElementValue)
															
														Else 
															$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "GetTransactionDetailsResponse/PaymentTransactionDetails/PaymentInfo/"+$2)
															If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
																DOM GET XML ELEMENT VALUE:C731($_t_SubReference3; $_t_ElementValue)
															Else 
																$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "GetTransactionDetailsResponse/PaymentTransactionDetails/PaymentItemInfo/"+$2)
																If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
																	DOM GET XML ELEMENT VALUE:C731($_t_SubReference3; $_t_ElementValue)
																Else 
																	$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "GetTransactionDetailsResponse/PaymentTransactionDetails/PaymentItemInfo/PaymentItem/"+$2)
																	If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
																		DOM GET XML ELEMENT VALUE:C731($_t_SubReference3; $_t_ElementValue)
																		
																	Else 
																		$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "GetTransactionDetailsResponse/PaymentTransactionDetails/PaymentItemInfo/Subscription/"+$2)
																		
																		If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
																			DOM GET XML ELEMENT VALUE:C731($_t_SubReference3; $_t_ElementValue)
																			
																		Else 
																			$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "GetTransactionDetailsResponse/PaymentTransactionDetails/PaymentItemInfo/Auction/"+$2)
																			If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
																				DOM GET XML ELEMENT VALUE:C731($_t_SubReference3; $_t_ElementValue)
																				
																			Else 
																				$_t_SubReference3:=DOM Find XML element:C864($_t_XMLREference; "GetTransactionDetailsResponse/PaymentTransactionDetails/OfferCouponInfo/"+$2)
																				If ($_t_SubReference3#$_t_NulString)  //This is from the basic response
																					DOM GET XML ELEMENT VALUE:C731($_t_SubReference3; $_t_ElementValue)
																					
																				Else 
																					$_t_ElementValue:="NOTFOUND"
																				End if 
																			End if 
																		End if 
																	End if 
																End if 
															End if 
														End if 
													End if 
												End if 
											End if 
										End if 
									End if 
								End if 
								$_t_ElementValue:=Replace string:C233($_t_ElementValue; Char:C90(1); "")
								$_t_ElementValue:=Replace string:C233($_t_ElementValue; Char:C90(2); "")
								$_t_ElementValue:=Replace string:C233($_t_ElementValue; Char:C90(3); "")
								$_t_ElementValue:=Replace string:C233($_t_ElementValue; Char:C90(4); "")
								$_t_ElementValue:=Replace string:C233($_t_ElementValue; Char:C90(5); "")
								$_t_ElementValue:=Replace string:C233($_t_ElementValue; Char:C90(6); "")
								$_t_ElementValue:=Replace string:C233($_t_ElementValue; Char:C90(7); "")
								$_t_ElementValue:=Replace string:C233($_t_ElementValue; Char:C90(8); "")
								$_t_ElementValue:=Replace string:C233($_t_ElementValue; Char:C90(10); "")
								$_t_ElementValue:=Replace string:C233($_t_ElementValue; Char:C90(11); "")
								$_t_ElementValue:=Replace string:C233($_t_ElementValue; Char:C90(12); "")
								$0:=$_t_ElementValue
								
							Else 
								$0:="ERROR"
								//we are not in the transaction details
							End if 
							
						Else 
							$0:=""
							
					End case 
				End if 
			Else 
				$0:=""
			End if 
	End case 
End if 
ERR_MethodTrackerReturn("CCM_ExtractField"; $_t_oldMethodName)