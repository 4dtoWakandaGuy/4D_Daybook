//%attributes = {}
If (False:C215)
	//Project Method Name:      SMS_SendMessage2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(bDataBlob)
	C_BOOLEAN:C305($_bo_Flash; $_bo_Seperate; $3; MSG_bo_QuickMessage)
	C_DATE:C307($_d_CurrentDate)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray)
	C_POINTER:C301($1; $2)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_DiaryCode; $_t_IDS; $_t_Mobile; $_t_oldMethodName; MSG_t_MessageFrom; SMS_AccountName; SMS_Password; tMessage)
	C_TIME:C306($_ti_Time)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SMS_SendMessage2")
// SMS_SendMessage2
// 26/06/02 pb
// parameters: $1=Pointer to array of mobile nos.
//                     $2=Pointer to array of contact codes
If (Count parameters:C259>=3)
	If ($3)
		$_bo_Seperate:=$3
	Else 
		$_bo_Seperate:=False:C215
	End if 
Else 
	$_bo_Seperate:=False:C215
End if 

If ($_bo_Seperate=False:C215)
	$_t_Mobile:=""
	$_t_IDS:=""
	$_l_SizeofArray:=Size of array:C274($1->)
	For ($_l_Index; 1; $_l_SizeofArray)
		$_t_Mobile:=$_t_Mobile+$1->{$_l_Index}+"|"  // mobile no.
		$_t_IDS:=$_t_IDS+$2->{$_l_Index}+"|"  // contact codes
	End for 
	$_bo_Flash:=False:C215  // flash message
	$_d_CurrentDate:=Current date:C33(*)
	$_ti_Time:=Current time:C178(*)
	SET BLOB SIZE:C606(bDataBlob; 0)
	VARIABLE TO BLOB:C532(SMS_AccountName; bDataBlob; *)
	VARIABLE TO BLOB:C532(SMS_Password; bDataBlob; *)
	VARIABLE TO BLOB:C532($_t_Mobile; bDataBlob; *)
	VARIABLE TO BLOB:C532(tMessage; bDataBlob; *)
	VARIABLE TO BLOB:C532($_bo_Flash; bDataBlob; *)  // send flash message -- not currently used
	VARIABLE TO BLOB:C532($_d_CurrentDate; bDataBlob; *)
	VARIABLE TO BLOB:C532($_ti_Time; bDataBlob; *)
	VARIABLE TO BLOB:C532(<>PER_t_CurrentUserInitials; bDataBlob; *)
	VARIABLE TO BLOB:C532($_l_SizeofArray; bDataBlob; *)  // the no.  of recipients
	VARIABLE TO BLOB:C532($_t_IDS; bDataBlob; *)  // the recipients' IDs
	//VARIABLE TO BLOB(SMS_From;bDataBlob;*)  ` the sender's ID (phone number or whate
	VARIABLE TO BLOB:C532(MSG_t_MessageFrom; bDataBlob; *)  // the sender's ID (phone number or whatever)
	If (MSG_bo_QuickMessage)
		$_t_DiaryCode:=""
	Else 
		$_t_DiaryCode:=[DIARY:12]Diary_Code:3
	End if 
	VARIABLE TO BLOB:C532($_t_DiaryCode; bDataBlob; *)
	
	ProcessServices_CreateRecord(->[DIARY:12]; ->[DIARY:12]x_ID:50; "SendSMS"; 0; 0; 0; False:C215; ->bDataBlob)
Else 
	$_l_SizeofArray:=Size of array:C274($1->)
	For ($_l_Index; 1; $_l_SizeofArray)
		$_t_Mobile:=""
		$_t_IDS:=""
		$_t_Mobile:=$1->{$_l_Index}+"|"  // mobile no.
		$_t_IDS:=$2->{$_l_Index}+"|"  // contact codes
		
		$_bo_Flash:=False:C215  // flash message
		$_d_CurrentDate:=Current date:C33(*)
		$_ti_Time:=Current time:C178(*)
		SET BLOB SIZE:C606(bDataBlob; 0)
		VARIABLE TO BLOB:C532(SMS_AccountName; bDataBlob; *)
		VARIABLE TO BLOB:C532(SMS_Password; bDataBlob; *)
		VARIABLE TO BLOB:C532($_t_Mobile; bDataBlob; *)
		VARIABLE TO BLOB:C532(tMessage; bDataBlob; *)
		VARIABLE TO BLOB:C532($_bo_Flash; bDataBlob; *)  // send flash message -- not currently used
		VARIABLE TO BLOB:C532($_d_CurrentDate; bDataBlob; *)
		VARIABLE TO BLOB:C532($_ti_Time; bDataBlob; *)
		VARIABLE TO BLOB:C532(<>PER_t_CurrentUserInitials; bDataBlob; *)
		VARIABLE TO BLOB:C532($_l_SizeofArray; bDataBlob; *)  // the no.  of recipients
		VARIABLE TO BLOB:C532($_t_IDS; bDataBlob; *)  // the recipients' IDs
		//VARIABLE TO BLOB(SMS_From;bDataBlob;*)  ` the sender's ID (phone number or whate
		VARIABLE TO BLOB:C532(MSG_t_MessageFrom; bDataBlob; *)  // the sender's ID (phone number or whatever)
		If (MSG_bo_QuickMessage)
			$_t_DiaryCode:=""
		Else 
			$_t_DiaryCode:=[DIARY:12]Diary_Code:3
		End if 
		VARIABLE TO BLOB:C532($_t_DiaryCode; bDataBlob; *)
		
		ProcessServices_CreateRecord(->[DIARY:12]; ->[DIARY:12]x_ID:50; "SendSMS"; 0; 0; 0; False:C215; ->bDataBlob)
	End for 
	
End if 
ERR_MethodTrackerReturn("SMS_SendMessage2"; $_t_oldMethodName)
