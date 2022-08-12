//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_AuthorizeNetSubmit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:43
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CCM_al_ResponseCodes;0)
	//ARRAY LONGINT(CCM_al_RowIndexIDS;0)
	ARRAY TEXT:C222($_at_FieldData; 0)
	ARRAY TEXT:C222($_at_FieldNames; 0)
	//ARRAY TEXT(CCM_at_ANFields;0)
	//ARRAY TEXT(CCM_at_ResponseReasons;0)
	//ARRAY TEXT(CCM_at_SubmitData;0)
	//ARRAY TEXT(HTTP_at_Data;0)
	//ARRAY TEXT(HTTP_at_FieldNames;0)
	C_BLOB:C604($_blb_Response; CCM_Bl_TransRecord)
	C_BOOLEAN:C305($_bo_Cancel; CCM_bo_IsLicenced)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_ErrorCode; $_l_Index; $_l_Row; $0; $1; CCM_l_Badtransactions; CCM_l_Goodtransactions; CCM_l_RunTest; CCM_l_TransrecordID; opt_CCM_l_Goodtransactions_1)
	C_LONGINT:C283(opt_CCM_l_Goodtransactions_2; opt_CCM_l_Goodtransactions_3; opt_CCM_l_Goodtransactions_4; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($2; HTTP_BlobPtr)
	C_REAL:C285($_r_PaymentAmount)
	C_TEXT:C284($_t_HostURL; $_t_oldMethodName; $_t_oldMethodName2; $_t_ResponseCodeSTR; $CCM_T_Response; CCM_T_AuthorizationLogin; HTTPClient_URL)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CCM_AuthorizeNetSubmit")


IWS_Register


Case of 
	: (CCM_T_AuthorizationLogin="92KgL2uD")  //| (CCM_l_RunTest=1)
		$_t_HostURL:="https://test.authorize.net/gateway/transact.dll"
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		
		WIN_l_CurrentWinRef:=Open window:C153(40; 40; 40; 40; -1984)
		DIALOG:C40("CCM_Testoptions")
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		CLOSE WINDOW:C154
		Case of 
			: (CCM_l_Goodtransactions=1)
				Case of 
					: (opt_CCM_l_Goodtransactions_1=1)
						CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_card_num"; "370000000000002")
					: (opt_CCM_l_Goodtransactions_2=1)
						CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_card_num"; "6011000000000012")
					: (opt_CCM_l_Goodtransactions_3=1)
						CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_card_num"; "5424000000000015")
					: (opt_CCM_l_Goodtransactions_4=1)
						CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_card_num"; "4007000000027")
					Else 
						CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_card_num"; "4007000000027")
				End case 
			: (CCM_l_Badtransactions=1)
				CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_test_request"; "TRUE")
				
				CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_card_num"; "4222222222222")
				$_r_PaymentAmount:=CCM_al_ResponseCodes{CCM_at_ResponseReasons}
				If ($_r_PaymentAmount=0)
					$_r_PaymentAmount:=27
				End if 
				CCM_AN_INSERTDATA(CCM_l_TransrecordID; "x_amount"; String:C10($_r_PaymentAmount)+".00")
				
				
				//4222222222222
		End case 
	: (Not:C34(CCM_bo_IsLicenced)) | (CCM_l_RunTest=1)
		
		$_t_HostURL:="https://certification.authorize.net/gateway/transact.dll"
		
	Else 
		$_t_HostURL:="https://secure.authorize.net/gateway/transact.dll"
End case 
If (Count parameters:C259>=1)
	If ($1>0)
		$_t_oldMethodName2:=ERR_MethodTracker("Row ID="+String:C10($1))
		
		$_l_Row:=Find in array:C230(CCM_al_RowIndexIDS; $1)
		
		If ($_l_Row>0)
			If (Macintosh option down:C545) | (Windows Ctrl down:C562)
				ARRAY TEXT:C222(HTTP_at_FieldNames; 0)
				ARRAY TEXT:C222(HTTP_at_Data; 0)
				For ($_l_Index; 1; Size of array:C274(CCM_at_SubmitData{$_l_Row}))
					If (CCM_at_SubmitData{$_l_Row}{$_l_Index}#"")
						APPEND TO ARRAY:C911(HTTP_at_FieldNames; CCM_at_ANFields{$_l_Index})
						APPEND TO ARRAY:C911(HTTP_at_Data; CCM_at_SubmitData{$_l_Row}{$_l_Index})
					End if 
				End for 
				HTTPClient_URL:=$_t_HostURL
				HTTP_BlobPtr:=$2
				DIALOG:C40("CCM_PostValuesTest")
				
				If (OK=1)
					$CCM_T_Response:=BLOB to text:C555($2->; 3)
					//Strip the header from the text
					
					$_t_ResponseCodeSTR:=CCM_ExtractField("Authorize Net"; "Response Code"; $CCM_T_Response)
					$0:=Num:C11($_t_ResponseCodeSTR)
				Else 
					$0:=0
				End if 
			Else 
				
				ARRAY TEXT:C222($_at_FieldNames; 0)
				ARRAY TEXT:C222($_at_FieldData; 0)
				//Here we will extract the data from the arrays
				For ($_l_Index; 1; Size of array:C274(CCM_at_SubmitData{$_l_Row}))
					If (CCM_at_SubmitData{$_l_Row}{$_l_Index}#"")
						$_t_oldMethodName2:=ERR_MethodTracker("Data field"+CCM_at_ANFields{$_l_Index}+" data "+CCM_at_SubmitData{$_l_Row}{$_l_Index})
						
						APPEND TO ARRAY:C911($_at_FieldNames; CCM_at_ANFields{$_l_Index})
						APPEND TO ARRAY:C911($_at_FieldData; CCM_at_SubmitData{$_l_Row}{$_l_Index})
					End if 
				End for 
				//```
				Repeat 
					
					
					// Initiate a new request
					NTK_NewRequest($_t_HostURL)
					
					// Add the request parameters
					For ($_l_Index; 1; Size of array:C274($_at_FieldNames))
						NTK_HTTP_Addparameter($_at_FieldNames{$_l_Index}; $_at_FieldData{$_l_Index}; ->CCM_Bl_TransRecord)
					End for 
					
					// Send the request
					
					$_l_ErrorCode:=NTK_HTTP_POST($2; ->CCM_Bl_TransRecord)
					
					
					
					// Clean up
					NTK_HTTP_DeleteRequest
					
					//$_blb_Response contaains the  response data in a blob already
					$CCM_T_Response:=BLOB to text:C555($2->; 3)
					//Strip the header from the text
					$_t_oldMethodName2:=ERR_MethodTracker("Data Returned "+$CCM_T_Response)
					
					
					$_t_ResponseCodeSTR:=CCM_ExtractField("Authorize Net"; "Response Code"; $CCM_T_Response)
					$0:=Num:C11($_t_ResponseCodeSTR)
					$_bo_Cancel:=False:C215
					If ($CCM_T_Response="")
						$_t_oldMethodName2:=ERR_MethodTracker("PROBLEM submitting!")
						
						Gen_Confirm("There was a problem processing the transaction, would you like to try again?"; "Yes"; "No")
						If (OK=0)
							$_bo_Cancel:=True:C214
						End if 
					End if 
				Until ($CCM_T_Response#"") | ($_bo_Cancel)
				
			End if 
			
		Else 
			Gen_Alert("Sorry you are trying to access a transaction that does not exist")
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("CCM_AuthorizeNetSubmit"; $_t_oldMethodName)