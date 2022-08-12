//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers50001
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_Vers50001")
User_Message(Char:C90(13)+"   Updating Soundex")
DD_SoundlikeBuilder

READ WRITE:C146([JOBS:26])
QUERY:C277([JOBS:26]; [JOBS:26]x_ID:49=0)
If (Records in selection:C76([JOBS:26])>0)
	User_Message(Char:C90(13)+"   Updating Job records")
	
	DB_lockFile(->[JOBS:26])
	APPLY TO SELECTION:C70([JOBS:26]; [JOBS:26]x_ID:49:=0)
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[JOBS:26]))
End if 

READ WRITE:C146([CONTRACTS:17])
QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]x_ID:12=0)
If (Records in selection:C76([CONTRACTS:17])>0)
	User_Message(Char:C90(13)+"   Updating Contract records")
	
	DB_lockFile(->[CONTRACTS:17])
	APPLY TO SELECTION:C70([CONTRACTS:17]; [CONTRACTS:17]x_ID:12:=0)
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[CONTRACTS:17]))
End if 

READ WRITE:C146([ORDERS:24])
QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=0)
If (Records in selection:C76([ORDERS:24])>0)
	User_Message(Char:C90(13)+"   Updating Order records")
	DB_lockFile(->[ORDERS:24])
	APPLY TO SELECTION:C70([ORDERS:24]; [ORDERS:24]x_ID:58:=0)
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDERS:24]))
End if 
READ WRITE:C146([PROJECTS:89])
QUERY:C277([PROJECTS:89]; [PROJECTS:89]X_ID:11=0)
If (Records in selection:C76([PROJECTS:89])>0)
	User_Message(Char:C90(13)+"   Updating Project records")
	DB_lockFile(->[PROJECTS:89])
	APPLY TO SELECTION:C70([PROJECTS:89]; [PROJECTS:89]X_ID:11:=0)
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[PROJECTS:89]))
End if 





QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]FileNo:5=0)
If (Records in selection:C76([EMAIL_ATTACHMENTS:103])>0)
	User_Message(Char:C90(13)+"   Updating eMail Attachment records")
	DB_lockFile(->[EMAIL_ATTACHMENTS:103])
	APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]FileNo:5:=0)
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
End if 

QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=0)
If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
	User_Message(Char:C90(13)+"   Updating Stock Item records")
	DB_lockFile(->[STOCK_MOVEMENT_ITEMS:27])
	APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0)
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
End if 

User_Message(Char:C90(13)+"   Updating Company Records")
READ WRITE:C146([COMPANIES:2])  // 19/11/02 NG & PB
ALL RECORDS:C47([COMPANIES:2])
DB_lockFile(->[COMPANIES:2])
APPLY TO SELECTION:C70([COMPANIES:2]; [COMPANIES:2]Company_Code:1:=[COMPANIES:2]Company_Code:1)
AA_CheckFileUnlockedByTableNUM(Table:C252(->[COMPANIES:2]))
UNLOAD RECORD:C212([COMPANIES:2])
ERR_MethodTrackerReturn("User_Vers50001"; $_t_oldMethodName)