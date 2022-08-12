//%attributes = {}
If (False:C215)
	//Project Method Name:      Startup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/11/2009 20:17`Method: Startup
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_DataAuditProcessID;0)
	//ARRAY LONGINT(<>SYS_al_ModifiedTable;0)
	ARRAY LONGINT:C221($_al_RedoCalledOff; 0)
	ARRAY LONGINT:C221($_al_TransactionIDS; 0)
	//ARRAY TEXT(<>SYS_at_DataAuditProcessName;0)
	//ARRAY TEXT(<>SYS_at_ModifiedText;0)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; <>SYS_bo_PWActive; <>SYS_bo_PWActiveOLD; $_bo_ProcessVisible; $_bo_Unload)
	C_LONGINT:C283(<>SYS_l_LoggedInaccount; $_l_Application_type; $_l_ProcessIndex; $_l_ProcessState; $_l_ProcessTime; $_l_UniqueProcessID)
	C_TEXT:C284($_t_oldMethodName; $_t_processName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Startup")
//AAAA

//DSPLY_LoadPrefs   `added 27/06/08 -kmw
//◊DSPLY_bo_DisplayProgressBars:=DSPLY_bo_DisplayProgressBars  `added 27/06/08 -kmw (progress bars check is done regularly so in this case for speed of access it is worth it to store the pref in an interprocess on startup and after change to pref)

$_l_Application_type:=Application type:C494
If ($_l_Application_type<4)  //bsw 19/07/03 app type 4 is 4d client and less than 4 single usser 4d, engine, run  `time
	
	ARRAY TEXT:C222(<>SYS_at_ModifiedText; 100)  //used for data audit
	ARRAY LONGINT:C221(<>SYS_al_ModifiedTable; 100)
	ARRAY TEXT:C222(<>SYS_at_DataAuditProcessName; Get last table number:C254)
	ARRAY LONGINT:C221(<>SYS_al_DataAuditProcessID; Get last table number:C254)
	$_bo_Unload:=(Records in selection:C76([USER:15])=0)
	If (<>SYS_l_LoggedInaccount=0)
		QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
	Else 
		QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
	End if 
	<>SYS_bo_PWActive:=[USER:15]SinglePWsystem:235
	
	PW_CHECKUSERS
	
	If (Records in table:C83([IDENTIFIERS:16])<30)  //changed from 29 to 30, 23/03/07 -kmw
		QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1<=999)
		//<>SYS_l_MaxConnectedUsers:=1
		//<>ConWPUsers:=1
		//<>ConIMUsers:=1
		
		Start_Files
	End if 
	
	Modules_Array
	
	User_Details(1; True:C214)
	
	If ($_bo_Unload)
		UNLOAD RECORD:C212([USER:15])
	End if 
Else 
	GET PROCESS VARIABLE:C371(-1; <>SYS_bo_PWActive; <>SYS_bo_PWActive)
	
End if 

START_CLient

While (Semaphore:C143("InitEmail"))
	DelayTicks(2)
End while 

If (<>Email_bo_PersonInited=False:C215)
	LOGIN_SetEmail
End if 
CLEAR SEMAPHORE:C144("InitEmail")


START_SetTablesAndFields

While (Semaphore:C143("HoldsInUse"))
	DelayTicks(2)
End while 

ARRAY LONGINT:C221($_al_TransactionIDS; 0)
For ($_l_ProcessIndex; 1; Count user processes:C343)
	PROCESS PROPERTIES:C336($_l_ProcessIndex; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
	If ($_l_UniqueProcessID>0)
		APPEND TO ARRAY:C911($_al_TransactionIDS; $_l_UniqueProcessID)
	End if 
	
End for 


READ WRITE:C146([STK_TransactionHolds:192])
ALL RECORDS:C47([STK_TransactionHolds:192])
CREATE SET:C116([STK_TransactionHolds:192]; "$Temp")

QUERY WITH ARRAY:C644([STK_TransactionHolds:192]xtransactionID:2; $_al_TransactionIDS)  //find only valid transaction ids
CREATE SET:C116([STK_TransactionHolds:192]; "$Temp2")
DIFFERENCE:C122("$Temp"; "$Temp2"; "$Temp")
USE SET:C118("$temp")
//QUERY SELECTION([STK_TransactionHolds];[STK_TransactionHolds]MachineName="";*)
QUERY SELECTION:C341([STK_TransactionHolds:192]; [STK_TransactionHolds:192]xtransactionID:2>0; *)
QUERY SELECTION:C341([STK_TransactionHolds:192];  & ; [STK_TransactionHolds:192]MachineName:6=Current machine:C483)

SELECTION TO ARRAY:C260([STK_TransactionHolds:192]XstockMovementItemID:3; $_al_RedoCalledOff)
APPLY TO SELECTION:C70([STK_TransactionHolds:192]; [STK_TransactionHolds:192]XCalledOffByMovementItemID:5:=0)
APPLY TO SELECTION:C70([STK_TransactionHolds:192]; [STK_TransactionHolds:192]xCalledOffQty:4:=0)
APPLY TO SELECTION:C70([STK_TransactionHolds:192]; [STK_TransactionHolds:192]XstockMovementItemID:3:=0)
APPLY TO SELECTION:C70([STK_TransactionHolds:192]; [STK_TransactionHolds:192]xtransactionID:2:=0)
CLEAR SEMAPHORE:C144("HoldsInUse")
If (Size of array:C274($_al_RedoCalledOff)>0)
	//TRACE
End if 

For ($_l_ProcessIndex; 1; Size of array:C274($_al_RedoCalledOff))
	STK_UpdateCalledOffQuantity(-$_al_RedoCalledOff{$_l_ProcessIndex}; 0)
End for 
ERR_MethodTrackerReturn("Startup"; $_t_oldMethodName)
