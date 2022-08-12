//%attributes = {}

//Database Method Name:      DB_CreatPostAction
//------------------ Method Notes ------------------
//------------------ Revision Control ----------------
//Date Created:  02/10/2017
//Created BY:  DefaultUser
//Date Modified: 
//Modified By: DefaultUser
//Modification notes
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DATA_al_Tables;0)
	//ARRAY OBJECT(DATA_aOBJ_Parameters;0)
	//ARRAY TEXT(DATA_at_Actions;0)
	C_BLOB:C604($_Blb_FormStructure)
	C_BOOLEAN:C305($_Bo_ProcessArraysInited; DATA_bo_ProcessArraysInited)
	C_LONGINT:C283($_l_IterateArrays; $_l_PostActionProcessCreator; $_l_PostActionProcesser; $_l_TableToCreateFor; $_l_WaitForProcessEnd)
	C_OBJECT:C1216($_Obj_ActionParameters)
	C_TEXT:C284($_Txt_ActionName; DIFF_t_MethodType)
	C_TIME:C306($_ti_FormDocument)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_CreatPostAction")

If ($_l_TableToCreateFor>0) & ($_Txt_ActionName#"")
	ARRAY LONGINT:C221(DATA_al_Tables; 0)
	ARRAY OBJECT:C1221(DATA_aOBJ_Parameters; 0)
	ARRAY TEXT:C222(DATA_at_Actions; 0)
	
	//if we are in a transaction..we dont want the process service record to be created in the transaction
	//we will recall this method in a process which will wait till the current Process_Ends...only one process to be created though
	If (In transaction:C397)
		APPEND TO ARRAY:C911(DATA_al_Tables; $_l_TableToCreateFor)
		APPEND TO ARRAY:C911(DATA_aOBJ_Parameters; $_Obj_ActionParameters)
		APPEND TO ARRAY:C911(DATA_at_Actions; $_Txt_ActionName)
		//Recall this method in a Process-that process will wait for this one to end.
		//note that the process post actions will then exist even if this transaciton does not complete so the code in the process handler has to cope properly with a record not being there.
		//it will not WAIT for the record to exist because by the time it is called the record must either exist or not.
		
		//note that we only create one process..so if we save a million records on a table it does not create a million processes..
		//one more thing to note DO NOT EVER START A TRANSACTION IN THE 'USER/RUNTIME PROCESS'-because this will never end:)
		
		$_l_PostActionProcessCreator:=New process:C317("DATA_CreatePostAction"; 128000; "Data Action Creator for Process "+String:C10(Current process:C322); $_l_TableToCreateFor; $_Txt_ActionName; $_Obj_ActionParameters; Current process:C322; *)
		//note that in the above the values of the parameters dont really count!
		GET PROCESS VARIABLE:C371($_l_PostActionProcessCreator; DATA_bo_ProcessArraysInited; $_Bo_ProcessArraysInited)
		If (Not:C34($_Bo_ProcessArraysInited))
			While (Not:C34($_Bo_ProcessArraysInited))
				UTIL_DelayTicks(2)
				GET PROCESS VARIABLE:C371($_l_PostActionProcessCreator; DATA_bo_ProcessArraysInited; $_Bo_ProcessArraysInited)
			End while 
		End if 
		VARIABLE TO VARIABLE:C635($_l_PostActionProcessCreator; DATA_aOBJ_Parameters; DATA_aOBJ_Parameters; DATA_al_Tables; DATA_al_Tables; DATA_at_Actions; DATA_at_Actions)
		
		
		
	Else 
		DATA_bo_ProcessArraysInited:=True:C214
		If ($_l_WaitForProcessEnd>0)  //This is the process receiving requests. This will not process anything until The calling Process_Ends
			While (Process state:C330($_l_WaitForProcessEnd)>0)
				UTIL_DelayTicks(60*10)
			End while 
			//The calling process has ended and the arrays are set
			For ($_l_IterateArrays; 1; Size of array:C274(DATA_at_Actions))
				//to keep this nice and simple we now call this method to create the record
				//DATA_CreatePostAction(DATA_al_Tables{$_l_IterateArrays};DATA_at_Actions{$_l_IterateArrays};DATA_aOBJ_Parameters{$_l_IterateArrays})
			End for 
			
		Else 
			While (Semaphore:C143("DATAPROCESSRECORDACCESS"))
				UTIL_DelayTicks(2)
			End while 
			READ WRITE:C146([PROCESSES_TO_HANDLE:115])
			SET QUERY LIMIT:C395(1)
			QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]Status:2=-1)  //we only need one free record
			If (Records in selection:C76([PROCESSES_TO_HANDLE:115])>0)
				
				SET BLOB SIZE:C606([PROCESSES_TO_HANDLE:115]Data5Blob:12; 0)  //clear the contents
			Else 
				CREATE RECORD:C68([PROCESSES_TO_HANDLE:115])
			End if 
			SET BLOB SIZE:C606([PROCESSES_TO_HANDLE:115]Data5Blob:12; 0)
			[PROCESSES_TO_HANDLE:115]Status:2:=0
			[PROCESSES_TO_HANDLE:115]ServiceType:6:=$_Txt_ActionName
			[PROCESSES_TO_HANDLE:115]TableNumber:1:=$_l_TableToCreateFor
			VARIABLE TO BLOB:C532($_Obj_ActionParameters; [PROCESSES_TO_HANDLE:115]Data5Blob:12; *)
			SAVE RECORD:C53([PROCESSES_TO_HANDLE:115])
			//ALERT($_Txt_ActionName+"Created")
			SET QUERY LIMIT:C395(0)
			UNLOAD RECORD:C212([PROCESSES_TO_HANDLE:115])
			CLEAR SEMAPHORE:C144("DATAPROCESSRECORDACCESS")
		End if 
		
	End if 
	
	
End if 
//And finally Make sure the post process handler is running on the server
$_l_PostActionProcesser:=Execute on server:C373("ProcessServices"; 128000; "Service Process"; *)  //This will only run the one instance
RESUME PROCESS:C320($_l_PostActionProcesser)
ERR_MethodTrackerReturn("DB_CreatPostAction"; $_t_oldMethodName)