//%attributes = {}
If (False:C215)
	//Project Method Name:      Postcodes_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 09:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vArea; vButtDisPC; vLetterCode; vTitleL)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Postcodes_InLPB")
RELATE ONE:C42([POSTAL_CODES:50]Area_Code:2)
vArea:=[AREAS:3]Area_Name:2
vButtDisPC:="I  PMO  FSSSRCADT"
vTitleL:=Uppercase:C13(Term_PCWT("Postcode"))
vLetterCode:=Term_PCWT("Postcode From")
Gen_InDisCode(->[POSTAL_CODES:50]Postal_Code_From:1; ->vButtDisPC)
Input_Buttons(->[POSTAL_CODES:50]; ->vButtDisPC)
Macro_AccType("Load "+String:C10(Table:C252(->[POSTAL_CODES:50])))
ERR_MethodTrackerReturn("Postcodes_InLPB"; $_t_oldMethodName)