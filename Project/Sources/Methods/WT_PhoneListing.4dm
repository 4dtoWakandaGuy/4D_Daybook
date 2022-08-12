//%attributes = {}
If (False:C215)
	//Project Method Name:      WT_PhoneListing
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
	C_LONGINT:C283($_l_Index; vSepNum; vSpaceRef)
	C_TEXT:C284($_t_oldMethodName; vPersonnelExt; vPhoneList; vPhoneListName; vPhoneListText; vSepText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WT_PhoneListing")
//WT_PhoneListing: WT-21/08/01
//ALL RECORDS([PERSONNEL])`10/07/02 pb
QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38#1; *)
QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Extension:26#"")
ORDER BY:C49([PERSONNEL:11]; [PERSONNEL:11]Name:2; >)
If (Records in selection:C76([PERSONNEL:11])>0)
	For ($_l_Index; 1; Records in selection:C76([PERSONNEL:11]))
		vSpaceRef:=0
		vSepNum:=0
		vSpaceRef:=0
		vSepText:=""
		vPhoneListName:=""
		vPersonnelExt:=""
		vPhoneListText:=""
		vSpaceRef:=Position:C15(Char:C90(32); [PERSONNEL:11]Name:2)
		vPhoneListName:=Substring:C12([PERSONNEL:11]Name:2; 1; vSpaceRef+2)
		If (Length:C16(vPhoneListName)<13)
			vSepNum:=13-(Length:C16(vPhoneListName))
		Else 
			vSepNum:=3
		End if 
		vSepText:=(Char:C90(32)*3)
		If ([PERSONNEL:11]Extension:26#"")
			vPersonnelExt:=[PERSONNEL:11]Extension:26
		Else 
			vPersonnelExt:="N/E"
		End if 
		vPhoneListText:=vPhoneListName+" ... "+vPersonnelExt
		vPhoneList:=vPhoneList+Char:C90(13)+vPhoneListText
		NEXT RECORD:C51([PERSONNEL:11])
	End for 
End if 
ERR_MethodTrackerReturn("WT_PhoneListing"; $_t_oldMethodName)