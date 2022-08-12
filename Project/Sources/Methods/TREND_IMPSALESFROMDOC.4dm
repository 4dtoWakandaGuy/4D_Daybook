//%attributes = {}

If (False:C215)
	//Database Method Name:      TREND_IMPSALESFROMDOC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DocInText; 0)
	ARRAY TEXT:C222($_at_RecordsInText; 0)
	C_DATE:C307($_d_EndOfYear; $_d_LastPeriodEnd; $_D_LastPeriodStart)
	C_LONGINT:C283($_l_GetRecord; $_l_GetRecords; $_l_position; $_l_Year)
	C_TEXT:C284($_t_account; $_t_Amount; $_t_DocumentText; $_t_Group; $_t_oldMethodName; $_t_Period; $_t_Record; $_t_Remainder; $_t_Year)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("TREND_IMPSALESFROMDOC")

$_ti_DocumentRef:=Open document:C264(""; "TEXT")
ARRAY TEXT:C222($_at_DocInText; 0)
$_t_DocumentText:=""
Repeat 
	RECEIVE PACKET:C104($_ti_DocumentRef; $_t_DocumentText; 32000)
	If ($_t_DocumentText#"")
		APPEND TO ARRAY:C911($_at_DocInText; $_t_DocumentText)
	End if 
Until (OK=0) | ($_t_DocumentText="")
CLOSE DOCUMENT:C267($_ti_DocumentRef)
ARRAY TEXT:C222($_at_RecordsInText; 0)
$_t_Remainder:=""
For ($_l_GetRecords; 1; Size of array:C274($_at_DocInText))
	If ($_t_Remainder#"")
		$_at_DocInText{$_l_GetRecords}:=$_t_Remainder+$_at_DocInText{$_l_GetRecords}
		$_t_Remainder:=""
	End if 
	Repeat 
		$_l_position:=Position:C15(Char:C90(13); $_at_DocInText{$_l_GetRecords})
		If ($_l_position>0)
			$_t_Record:=Substring:C12($_at_DocInText{$_l_GetRecords}; 1; $_l_position-1)
			$_at_DocInText{$_l_GetRecords}:=Substring:C12($_at_DocInText{$_l_GetRecords}; $_l_position+1)
			APPEND TO ARRAY:C911($_at_RecordsInText; $_t_Record)
		End if 
		If ($_l_position=0)
			$_t_Remainder:=$_at_DocInText{$_l_GetRecords}
			$_at_DocInText{$_l_GetRecords}:=""
		End if 
	Until ($_l_position=0) | ($_at_DocInText{$_l_GetRecords}="")
End for 
If ($_t_Remainder#"")
	
End if 
//each row is one record
For ($_l_GetRecord; 1; Size of array:C274($_at_RecordsInText))
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_Year:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_Group:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_Amount:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Year:=Num:C11($_t_Year)
	
	$_t_account:=$_at_RecordsInText{$_l_GetRecord}
	$_d_EndOfYear:=((Date:C102("01/01/"+String:C10(Num:C11($_t_Year)+1))))-1
	QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=$_d_EndOfYear; *)
	QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=$_d_EndOfYear)
	If (Records in selection:C76([PERIODS:33])=0)
		//create missing periods
		
		Repeat 
			//ALL RECORDS([PERIODS])
			QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=$_d_EndOfYear)
			ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
			$_D_LastPeriodStart:=[PERIODS:33]From_Date:3
			$_d_LastPeriodEnd:=[PERIODS:33]To_Date:4
			If (Records in selection:C76([PERIODS:33])=0)  //end of previous year
				$_d_LastPeriodEnd:=((Date:C102("01/01/"+String:C10($_l_Year))))-1
			End if 
			Period_Create($_d_LastPeriodEnd+1; 12; True:C214)
			QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=$_d_EndOfYear; *)
			QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=$_d_EndOfYear)
		Until (Records in selection:C76([PERIODS:33])>0)
	End if 
	$_t_Period:=[PERIODS:33]Period_Code:1
	QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=$_t_Group)
	
	If (Records in selection:C76([ANALYSES:36])=0)
		CREATE RECORD:C68([ANALYSES:36])
		[ANALYSES:36]Analysis_Code:1:=$_t_Group
		[ANALYSES:36]Analysis_Name:2:="Customer Account Year Total"
		SAVE RECORD:C53([ANALYSES:36])
	End if 
	QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=$_t_account; *)
	QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4=$_t_Period; *)
	QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Analysis_Code:1=$_t_Group)
	
	If (Records in selection:C76([ACCOUNT_BALANCES:34])=0)
		CREATE RECORD:C68([ACCOUNT_BALANCES:34])
		[ACCOUNT_BALANCES:34]Period_Code:4:=$_t_Period
		[ACCOUNT_BALANCES:34]Account_Code:2:=$_t_account
		[ACCOUNT_BALANCES:34]Analysis_Code:1:=$_t_Group
		[ACCOUNT_BALANCES:34]Layer_Code:5:="X"  //this makes sure the account stays out of view-because the layer does not exist
		[ACCOUNT_BALANCES:34]NoBalanceCheck:9:=1  //this makes sure the account balance is never checked
	End if 
	If ([ACCOUNT_BALANCES:34]Balance:3#(Num:C11($_t_Amount)))
		[ACCOUNT_BALANCES:34]Balance:3:=Num:C11($_t_Amount)
		SAVE RECORD:C53([ACCOUNT_BALANCES:34])
	End if 
End for 
ERR_MethodTrackerReturn("TREND_IMPSALESFROMDOC"; $_t_oldMethodName)
