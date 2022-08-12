//%attributes = {}
If (False:C215)
	//Project Method Name:      DOC_GetContactDetails
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2009 11:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; $2; DOC_l_ContactIDreturn)
	C_TEXT:C284($_t_FindContactEmailAfter; $_t_FindContactEmailBefore; $_t_oldMethodName; $3; $4; $5; DOC_t_ContactCodeReturn; DOC_t_ContactNameReturn)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOC_GetContactDetails")

//This method is implemented for the email handler. This is so that it does not ever move the current record pointer
//This is useful when sending to additional recipients and email from say contacts
$_t_FindContactEmailBefore:=""
If (Count parameters:C259>3)
	$_t_FindContactEmailBefore:=$4  //Added 25/11/08 v631b120i -kmw
End if 

$_t_FindContactEmailAfter:=""
If (Count parameters:C259>4)
	$_t_FindContactEmailAfter:=$5  //Added 25/11/08 v631b120i -kmw
End if 

If (Count parameters:C259>=2)
	If (Count parameters:C259>=3)
		If ($2=0)
			If ($3="")  //Added 25/11/08 v631b120i -kmw
				Case of 
					: (Count parameters:C259>4)
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Email_Before_At:30=$_t_FindContactEmailBefore; *)  //Added 25/11/08 v631b120i -kmw
						QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Email_Before_At:30=$_t_FindContactEmailAfter)  //Added 25/11/08 v631b120i -kmw
					: (Count parameters:C259>3)
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Email_Before_At:30=$_t_FindContactEmailBefore)  //Added 25/11/08 v631b120i -kmw
					Else 
						//id is 0 contact code is zero and no email address passed
						REDUCE SELECTION:C351([CONTACTS:1]; 0)
				End case 
			Else   //Added 25/11/08 v631b120i -kmw
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$3)
			End if   //Added 25/11/08 v631b120i -kmw
			
		Else 
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$2)
		End if 
		
	Else 
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$2)
	End if 
	If (Records in selection:C76([CONTACTS:1])=1)
		SET PROCESS VARIABLE:C370($1; DOC_t_ContactNameReturn; [CONTACTS:1]Contact_Name:31)
		SET PROCESS VARIABLE:C370($1; DOC_t_ContactCodeReturn; [CONTACTS:1]Contact_Code:2)
		SET PROCESS VARIABLE:C370($1; DOC_l_ContactIDreturn; [CONTACTS:1]x_ID:33)
		
	Else 
		//a get out
		If (Records in selection:C76([CONTACTS:1])>1)  //Added 25/11/08 v631b120i -kmw
			// (if more than one then pass a negative of ID of first Contact found)
			SET PROCESS VARIABLE:C370($1; DOC_t_ContactNameReturn; [CONTACTS:1]Contact_Name:31)  //Added 25/11/08 v631b120i -kmw
			SET PROCESS VARIABLE:C370($1; DOC_t_ContactCodeReturn; [CONTACTS:1]Contact_Code:2)  //Added 25/11/08 v631b120i -kmw
			SET PROCESS VARIABLE:C370($1; DOC_l_ContactIDreturn; (-1*[CONTACTS:1]x_ID:33))  //Added 25/11/08 v631b120i -kmw
		Else   //Added 25/11/08 v631b120i -kmw
			SET PROCESS VARIABLE:C370($1; DOC_l_ContactIDreturn; -1)
		End if   //Added 25/11/08 v631b120i -kmw
	End if 
	
	
	
End if 
ERR_MethodTrackerReturn("DOC_GetContactDetails"; $_t_oldMethodName)