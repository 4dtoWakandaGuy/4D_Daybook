//%attributes = {}
If (False:C215)
	//Project Method Name:      CD_Setup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/02/2013 11:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DM_al_DataOwnerIDS;0)
	//ARRAY TEXT(DM_at_DataOwnerNames;0)
	C_LONGINT:C283($_l_CoreInfoID; $_l_Offset; DM_l_DataOwnerID)
	C_TEXT:C284($_t_DatatoSetup; $_t_oldMethodName; $1; DM_t_Org)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CD_Setup")

If (Count parameters:C259>=1)
	$_t_DatatoSetup:=$1
	$_l_CoreInfoID:=PREF_GetPreferenceID("Data Owners"; True:C214; -1)
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_CoreInfoID)  //There will be one record per data owner
	If (Records in selection:C76([PREFERENCES:116])=0)
		//if there are no records we will create one
		ALL RECORDS:C47([USER:15])
		ARRAY LONGINT:C221(DM_al_DataOwnerIDS; 0)
		ARRAY TEXT:C222(DM_at_DataOwnerNames; 0)
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_CoreInfoID
		[PREFERENCES:116]Preference_DataID:7:=-1
		DM_t_Org:=[USER:15]Organisation:1
		If ([USER:15]XdataOwnerID:251>0)
			DM_l_DataOwnerID:=[USER:15]XdataOwnerID:251
		Else 
			DM_l_DataOwnerID:=AA_GetNextID(->DM_l_DataOwnerID)
		End if 
		APPEND TO ARRAY:C911(DM_al_DataOwnerIDS; DM_l_DataOwnerID)
		APPEND TO ARRAY:C911(DM_at_DataOwnerNames; DM_t_Org)
		VARIABLE TO BLOB:C532(DM_al_DataOwnerIDS; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DM_at_DataOwnerNames; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
	Else 
		$_l_Offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_al_DataOwnerIDS; $_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_at_DataOwnerNames; $_l_Offset)
	End if 
	
	Case of 
		: ($_t_DatatoSetup="PERSONNEL")
			//open CONFIG_USERS
	End case 
	
End if 
ERR_MethodTrackerReturn("CD_Setup"; $_t_oldMethodName)