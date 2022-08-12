//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contacts_InEDry
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(u1; y1; y2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_InEDry")
DB_SaveRecord(->[DIARY:12])
AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
If (u1=1)
	If ([CONTACTS:1]Contact_Code:2="")
		REDUCE SELECTION:C351([DIARY:12]; 0)
	Else 
		QUERY:C277([DIARY:12]; [DIARY:12]Contact_Code:2=[CONTACTS:1]Contact_Code:2; *)
		Case of 
			: ((y2=1) & (y1=0))
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=True:C214)
			: ((y2=0) & (y1=1))
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=False:C215)
			Else 
				QUERY:C277([DIARY:12])
		End case 
	End if 
Else 
	If ([CONTACTS:1]Company_Code:1="")
		REDUCE SELECTION:C351([DIARY:12]; 0)
	Else 
		QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=[CONTACTS:1]Company_Code:1; *)
		Case of 
			: ((y2=1) & (y1=0))
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=True:C214)
			: ((y2=0) & (y1=1))
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=False:C215)
			Else 
				QUERY:C277([DIARY:12])
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("Contacts_InEDry"; $_t_oldMethodName)