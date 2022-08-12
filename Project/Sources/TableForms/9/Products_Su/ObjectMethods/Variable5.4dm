If (False:C215)
	//object Name: [PRODUCTS]Products_SU.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SVS_at_PreviewNote;0)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283(r1; r2; r3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_SU.Variable5"; Form event code:C388)
Case of 
	: ((SVS_at_PreviewNote=2) | (SVS_at_PreviewNote=0))
		SVS_at_PreviewNote:=2
		[PRODUCTS:9]Unit_Number:29:=7
		[PRODUCTS:9]Start_Number:30:=7
		r1:=1
		r2:=0
		r3:=0
	: (SVS_at_PreviewNote=1)
		[PRODUCTS:9]Unit_Number:29:=1
		[PRODUCTS:9]Start_Number:30:=0
		r1:=0
		r2:=0
		r3:=1
	: (SVS_at_PreviewNote=3)
		[PRODUCTS:9]Unit_Number:29:=31
		[PRODUCTS:9]Start_Number:30:=31
		r1:=0
		r2:=1
		r3:=0
	: (SVS_at_PreviewNote=4)
		[PRODUCTS:9]Unit_Number:29:=365
		[PRODUCTS:9]Start_Number:30:=31
		r1:=0
		r2:=1
		r3:=0
End case 
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_SU.Variable5"; $_t_oldMethodName)