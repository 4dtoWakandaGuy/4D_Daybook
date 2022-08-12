If (False:C215)
	//object Name: [TRANSACTION_BATCHES]TransB_In13_TEST.oArealistPopup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ACC_at_ModeTransIn;0)
	C_LONGINT:C283(ACC_l_ColumnAnalysis; ACC_l_ColumnCheque; ACC_l_ColumnCurrencyCode; ACC_l_ColumnJobCode; ACC_l_ColumnLayerCode; ACC_l_ColumnPICode; ACC_l_ColumnPoCode; AL_l_ColumnSInvNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].TransB_In13_TEST.oArealistPopup"; Form event code:C388)
Case of 
	: (FORM Get current page:C276<3)
		If (ACC_at_ModeTransIn=1)
			//AL_SetEntryOpts (ACC_l_SubItems;4;0;0;0;0)
			//AL_UpdateArrays (ACC_l_SubItems;-2)
			
		Else 
			If ([TRANSACTION_BATCHES:30]Posted_Date:16=!00-00-00!)
				
				
				//AL_SetEnterable (ACC_l_SubItems;1;2;ACC_at_BatchTransTypesCode)  `Transcode
				//AL_SetEnterable (ACC_l_SubItems;2;1)  `Transdescription
				//AL_SetEnterable (ACC_l_SubItems;3;1)  `Debit account
				//AL_SetEnterable (ACC_l_SubItems;4;0)  `Debit account name
				//AL_SetEnterable (ACC_l_SubItems;5;1)  `debit IO
				//AL_SetEnterable (ACC_l_SubItems;6;1)  `Credit account
				//AL_SetEnterable (ACC_l_SubItems;7;0)  `Credit account name
				//AL_SetEnterable (ACC_l_SubItems;8;1)  `Credit IO
				//AL_SetEnterable (ACC_l_SubItems;9;1)  `trans adate
				//AL_SetEnterable (ACC_l_SubItems;10;1)  `Period code
				//AL_SetEnterable (ACC_l_SubItems;11;1)  `amount
				//AL_SetEnterable (ACC_l_SubItems;12;1)  `tax code
				//AL_SetEnterable (ACC_l_SubItems;13;1)  `UKEC
				//AL_SetEnterable (ACC_l_SubItems;14;1)  `tax amount
				//AL_SetEnterable (ACC_l_SubItems;15;1)  `total
				If (ACC_l_ColumnCurrencyCode>0)
					//AL_SetEnterable (ACC_l_SubItems;ACC_l_ColumnCurrencyCode;1)  `current code
					//AL_SetEnterable (ACC_l_SubItems;ACC_l_ColumnCurrencyCode+1;0)  `current name
				End if 
				
				//AL_SetEnterable (ACC_l_SubItems;ACC_l_ColumnCompanyCode;1)  `Company Code
				//AL_SetEnterable (ACC_l_SubItems;ACC_l_ColumnCompanyCode+1;0)  `Company Name
				If (AL_l_ColumnSInvNumber>0)
					//AL_SetEnterable (ACC_l_SubItems;AL_l_ColumnSInvNumber;1)  `Sales Inv
				End if 
				If (ACC_l_ColumnJobCode>0)
					//AL_SetEnterable (ACC_l_SubItems;ACC_l_ColumnJobCode;1)  `job Code
				End if 
				
				If (ACC_l_ColumnPICode>0)
					//AL_SetEnterable (ACC_l_SubItems;ACC_l_ColumnPICode;1)  `Purchse Inv
				End if 
				If (ACC_l_ColumnPoCode>0)
					//AL_SetEnterable (ACC_l_SubItems;ACC_l_ColumnPoCode;1)  `Purch_Code
				End if 
				
				//AL_SetEnterable (ACC_l_SubItems;ACC_l_ColumnCheque;1)  `Cheque
				//AL_SetEnterable (ACC_l_SubItems;ACC_l_ColumnAnalysis;1)  `Anal Code
				//AL_SetEnterable (ACC_l_SubItems;ACC_l_ColumnAnalysis+1;1)  `Name
				If (ACC_l_ColumnLayerCode>0)
					//AL_SetEnterable (ACC_l_SubItems;ACC_l_ColumnLayerCode;1)  `Layer Code
					//AL_SetEnterable (ACC_l_SubItems;ACC_l_ColumnLayerCode+1;1)  `Name
				End if 
				//AL_UpdateArrays (ACC_l_SubItems;-2)
				
			Else 
				
				//AL_SetEntryOpts (ACC_l_SubItems;4;0;0;0;0)
				//AL_UpdateArrays (ACC_l_SubItems;-2)
				
				
			End if 
			
			
		End if 
		
	Else 
		//transactions area
End case 
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].TransB_In13_TEST.oArealistPopup"; $_t_oldMethodName)
