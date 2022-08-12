//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies_InPC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>PCN)
	C_TEXT:C284($_t_oldMethodName; $_t_Postcode; vArea)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_InPC")

If (<>PCN=0)  //NG July 2007 modified this so the default is no longer 1 it is default 0
	$_t_Postcode:=FirstWord([COMPANIES:2]Postal_Code:7)
Else 
	$_t_Postcode:=FirstLetters([COMPANIES:2]Postal_Code:7)
End if 
QUERY:C277([POSTAL_CODES:50]; [POSTAL_CODES:50]Postal_Code_From:1=$_t_Postcode)
If (Records in selection:C76([POSTAL_CODES:50])=0)
	QUERY:C277([POSTAL_CODES:50]; [POSTAL_CODES:50]Postal_Code_From:1<=$_t_Postcode; *)
	QUERY:C277([POSTAL_CODES:50];  & ; [POSTAL_CODES:50]Postal_Code_To:4>=$_t_Postcode)
End if 
If (Records in selection:C76([POSTAL_CODES:50])>0)
	[COMPANIES:2]Area:11:=[POSTAL_CODES:50]Area_Code:2
	RELATE ONE:C42([COMPANIES:2]Area:11)
	vArea:=[AREAS:3]Area_Name:2
	Comp_InLPArea
End if 
ERR_MethodTrackerReturn("Companies_InPC"; $_t_oldMethodName)