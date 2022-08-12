//%attributes = {}

If (False:C215)
	//Database Method Name:      SD2_DiaryEntry
	//------------------ Method Notes ------------------
	
	
	
	// ----------------------------------------------------
	// Creator: Nigel Greenlee
	//Date & time: 23/11/2009`Method: SD2_DiaryEntry
	//Description
	
	//Parameters
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
	
	//------------------ Revision Control ----------------
	//Date Created:  07/10/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_RelationFieldParameter; 0)
	ARRAY LONGINT:C221($_al_RelationshipRecordClass; 0)
	ARRAY LONGINT:C221($_al_RelationshiptIDParameter; 0)
	ARRAY LONGINT:C221($_al_RelationTableParameter; 0)
	//ARRAY LONGINT(SD2_al_RelatedRecordClass;0)
	//ARRAY LONGINT(SD2_al_RelationshipFields;0)
	//ARRAY LONGINT(SD2_al_RelationshipIDS;0)
	//ARRAY LONGINT(SD2_al_RelationshipTables;0)
	ARRAY TEXT:C222($_at_ActionCodesParameter; 0)
	ARRAY TEXT:C222($_at_DiaryPersons; 0)
	ARRAY TEXT:C222($_at_RelationsShipCodeParam; 0)
	ARRAY TEXT:C222($_at_VariableNames; 0)
	ARRAY TEXT:C222($_at_VarValues; 0)
	//ARRAY TEXT(SD2_at_ActionCodes;0)
	//ARRAY TEXT(SD2_at_AdditionalPersons;0)
	//ARRAY TEXT(SD2_at_RelationshipCodes;0)
	//ARRAY TEXT(SD2_at_VariableStrings;0)
	//ARRAY TEXT(SD2_AT_VariableValues;0)
	C_LONGINT:C283($_l_CurrentProcess; $_l_DiaryType; $_l_Index; $_l_ProcessID; $_l_ProcessMemory; $2; $4; $5; SD2_l_ProcessReady)
	C_POINTER:C301($10; $11; $12; $13; $14; $7; $8; $9)
	C_TEXT:C284($_t_InputForm; $_t_oldMethodName; $_t_ProcessMethodName; $_t_ProcessName; $_t_ProcessParameter1; $1; $3; $6)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryEntry")

//This method calls Zproc to create a new diary record but i need to pass to the process some values and one of them is an array
$_t_InputForm:=""
If (Count parameters:C259>=5)
	$_t_ProcessMethodName:=$1
	$_l_ProcessMemory:=$2
	$_t_ProcessName:=$3
	$_t_ProcessParameter1:=String:C10($4)
	$_l_DiaryType:=$5
	If (Count parameters:C259>=6)
		$_t_InputForm:=$6
	End if 
	While (Semaphore:C143("$StartDiary"))
		DelayTicks(2)
	End while 
	SD2_l_ProcessReady:=0
	If (Count parameters:C259>=7)
		ARRAY LONGINT:C221($_al_RelationTableParameter; 0)  //The table number to be related to the diary
		ARRAY LONGINT:C221($_al_RelationFieldParameter; 0)  // the Field in that table for the relationshipt(this can be code or ID)
		ARRAY LONGINT:C221($_al_RelationshiptIDParameter; 0)  //the x_ID related record ID
		ARRAY TEXT:C222($_at_RelationsShipCodeParam; 0)  // the CODE related record code
		ARRAY LONGINT:C221($_al_RelationshipRecordClass; 0)  //the arrray for the record class-this is only going to be used for job/job stages at the moment as the table contains mulitple types
		// of record-the class controls which types labeling are used
		//note that both these get filled in anyway
		ARRAY TEXT:C222($_at_ActionCodesParameter; 0)
		ARRAY TEXT:C222($_at_VariableNames; 0)
		ARRAY TEXT:C222($_at_VarValues; 0)
		
		If (Type:C295($7->)=String array:K8:15) | (Type:C295($7->)=Text array:K8:16)
			ARRAY TEXT:C222($_at_ActionCodesParameter; Size of array:C274($7->))
			For ($_l_Index; 1; Size of array:C274($7->))
				$_at_ActionCodesParameter{$_l_Index}:=$7->{$_l_Index}
				
			End for 
		Else 
			ARRAY TEXT:C222($_at_ActionCodesParameter; 1)
			$_at_ActionCodesParameter{1}:=$7->
		End if 
	End if 
	If (Count parameters:C259>=9)
		//$8 $9 $10 are matched so must all be sent
		If (Type:C295($8->)=LongInt array:K8:19)
			ARRAY LONGINT:C221($_al_RelationTableParameter; Size of array:C274($8->))
			ARRAY LONGINT:C221($_al_RelationFieldParameter; Size of array:C274($9->))
			ARRAY LONGINT:C221($_al_RelationshiptIDParameter; Size of array:C274($10->))
			ARRAY TEXT:C222($_at_RelationsShipCodeParam; Size of array:C274($10->))
			ARRAY LONGINT:C221($_al_RelationshipRecordClass; Size of array:C274($8->))
			For ($_l_Index; 1; Size of array:C274($8->))
				$_al_RelationTableParameter{$_l_Index}:=$8->{$_l_Index}
				$_al_RelationFieldParameter{$_l_Index}:=$9->{$_l_Index}
				If (Type:C295($10->)=LongInt array:K8:19)
					//Note that INVOICE and trans in the longint array is the record ID not the X_ID
					
					$_al_RelationshiptIDParameter{$_l_Index}:=$10->{$_l_Index}
					$_at_RelationsShipCodeParam{$_l_Index}:=SD2_GetRecordCode($_al_RelationTableParameter{$_l_Index}; $_al_RelationFieldParameter{$_l_Index}; $_al_RelationshiptIDParameter{$_l_Index})
					
				Else 
					$_at_RelationsShipCodeParam{$_l_Index}:=$10->{$_l_Index}
					$_al_RelationshiptIDParameter{$_l_Index}:=SD2_GetRecordID($_al_RelationTableParameter{$_l_Index}; $_al_RelationFieldParameter{$_l_Index}; $_at_RelationsShipCodeParam{$_l_Index})
					
				End if 
				If (Count parameters:C259>=11)
					$_al_RelationshipRecordClass{$_l_Index}:=$11->{$_l_Index}
				End if 
				
			End for 
		Else 
			//Parameters are variables not arrays
			ARRAY LONGINT:C221($_al_RelationTableParameter; 1)
			ARRAY LONGINT:C221($_al_RelationFieldParameter; 1)
			ARRAY LONGINT:C221($_al_RelationshiptIDParameter; 1)
			ARRAY TEXT:C222($_at_RelationsShipCodeParam; 1)
			ARRAY LONGINT:C221($_al_RelationshipRecordClass; 1)
			$_al_RelationTableParameter{1}:=$8->
			$_al_RelationFieldParameter{1}:=$9->
			If (Type:C295($10->)=Is longint:K8:6)
				$_al_RelationshiptIDParameter{1}:=$10->
			Else 
				$_at_RelationsShipCodeParam{1}:=$10->
			End if 
			If (Count parameters:C259>=11)
				$_al_RelationshipRecordClass{1}:=$11->
			End if 
		End if 
		
		If (Count parameters:C259>=13)
			//$11 is an array of references
			ARRAY TEXT:C222($_at_VariableNames; 0)
			ARRAY TEXT:C222($_at_VarValues; 0)
			For ($_l_Index; 1; Size of array:C274($12->))
				Case of 
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]Action_Details:10))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_T_InputActionDesc")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]Result_Code:11))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_t_InputResultCode")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]Result_Description:12))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_T_InputResultDesc")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]Date_Do_From:4)) | ($12->{$_l_Index}=Field:C253(->[DIARY:12]Date_Done_From:5))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_D_InputDate")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]Date_Do_To:33)) | ($12->{$_l_Index}=Field:C253(->[DIARY:12]Date_Done_To:34))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_D_InputDateTo")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]Time_Do_From:6)) | ($12->{$_l_Index}=Field:C253(->[DIARY:12]Time_Do_To:35))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_ti_InputTime")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]Time_Done_From:7)) | ($12->{$_l_Index}=Field:C253(->[DIARY:12]Time_Done_To:36))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_ti_InputTime")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]Time_Done_From:7)) | ($12->{$_l_Index}=Field:C253(->[DIARY:12]Time_Done_To:36))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_ti_InputTimeTo")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]Document_Code:15))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_t_InputDocumentCode")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]Person:8))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_t_InputPersonCode")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]Budget_Units:70))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_R_InputBudgetUnits")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]Units:20))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_R_InputUnits")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]Charge_Rate:22))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_R_inputUnitRate")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]Subject:63))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_t_InputSubject")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]Subject:63))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_t_InputSubject")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]ThreadID:64))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_l_InputAddtotrhead")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]x_Is_Thread:68))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_bo_CreateThread")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]Data_Source_Table:49))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_l_LinkToParent")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]Data_Source_Table:49))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_l_LinkToParent")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
					: ($12->{$_l_Index}=Field:C253(->[DIARY:12]Priority:17))
						APPEND TO ARRAY:C911($_at_VariableNames; "SD2_s10_Priority")
						APPEND TO ARRAY:C911($_at_VarValues; $13->{$_l_Index})
						
				End case 
			End for 
			
		End if 
		ARRAY TEXT:C222($_at_DiaryPersons; 0)  //This is used where there is  more than one-if not the variable SD2_t_InputPersonCode should be set by including a pointer to the diary person field and a person code
		If (Count parameters:C259>=14)  //list of people diary to belong to
			For ($_l_Index; 1; Size of array:C274($14->))
				APPEND TO ARRAY:C911($_at_DiaryPersons; $14->{$_l_Index})
			End for 
		End if 
		//Make sure that any methods you call using this can handle accepting the parameters above
		SD2_l_ProcessReady:=0
		$_l_ProcessID:=ZProc_withReply($_t_ProcessMethodName; $_l_ProcessMemory; $_t_ProcessName; String:C10($_l_DiaryType); $_t_ProcessParameter1; $_t_InputForm)
		DelayTicks(30)
		
		While (SD2_l_ProcessReady=0)
			GET PROCESS VARIABLE:C371($_l_ProcessID; SD2_l_ProcessReady; SD2_l_ProcessReady)
			If (SD2_l_ProcessReady=0)
				DelayTicks(2)
				
			End if 
		End while 
		
		//Send the variables to the process
		VARIABLE TO VARIABLE:C635($_l_ProcessID; SD2_at_ActionCodes; $_at_ActionCodesParameter)
		VARIABLE TO VARIABLE:C635($_l_ProcessID; SD2_al_RelationshipTables; $_al_RelationTableParameter)
		VARIABLE TO VARIABLE:C635($_l_ProcessID; SD2_al_RelationshipFields; $_al_RelationFieldParameter)
		VARIABLE TO VARIABLE:C635($_l_ProcessID; SD2_at_RelationshipCodes; $_at_RelationsShipCodeParam)
		VARIABLE TO VARIABLE:C635($_l_ProcessID; SD2_al_RelationshipIDS; $_al_RelationshiptIDParameter)
		VARIABLE TO VARIABLE:C635($_l_ProcessID; SD2_al_RelatedRecordClass; $_al_RelationshipRecordClass)
		
		//VARIABLE TO VARIABLE($_l_ProcessID;SD2_al_RelatedTypes;$_al_RelationTableParameter)
		VARIABLE TO VARIABLE:C635($_l_ProcessID; SD2_at_VariableStrings; $_at_VariableNames)
		VARIABLE TO VARIABLE:C635($_l_ProcessID; SD2_AT_VariableValues; $_at_VarValues)
		VARIABLE TO VARIABLE:C635($_l_ProcessID; SD2_at_AdditionalPersons; $_at_DiaryPersons)
		
		SD2_l_ProcessReady:=2
		SET PROCESS VARIABLE:C370($_l_ProcessID; SD2_l_ProcessReady; SD2_l_ProcessReady)
		
		
	Else 
		ARRAY LONGINT:C221($_al_RelationTableParameter; 0)
		ARRAY LONGINT:C221($_al_RelationFieldParameter; 0)
		ARRAY LONGINT:C221($_al_RelationshiptIDParameter; 0)
		ARRAY TEXT:C222($_at_RelationsShipCodeParam; 0)
		ARRAY TEXT:C222($_at_ActionCodesParameter; 0)
		ARRAY LONGINT:C221($_al_RelationshipRecordClass; 0)  //the arrray for the record class-this is only going to be used for job/job stages at the moment as the table contains mulitple types
		ARRAY TEXT:C222($_at_VariableNames; 0)
		ARRAY TEXT:C222($_at_VarValues; 0)
		SD2_l_ProcessReady:=0
		$_l_ProcessID:=ZProc_withReply($_t_ProcessMethodName; $_l_ProcessMemory; $_t_ProcessName; String:C10($_l_DiaryType); $_t_ProcessParameter1; $_t_InputForm)
		DelayTicks(30)
		While (SD2_l_ProcessReady=0)
			GET PROCESS VARIABLE:C371($_l_ProcessID; SD2_l_ProcessReady; SD2_l_ProcessReady)
			If (SD2_l_ProcessReady=0)
				DelayTicks(2)
			End if 
		End while 
		//Not point in passing empty arrays
		SD2_l_ProcessReady:=2
		SET PROCESS VARIABLE:C370($_l_ProcessID; SD2_l_ProcessReady; SD2_l_ProcessReady)
		
		
	End if 
	CLEAR SEMAPHORE:C144("$StartDiary")
Else 
	Gen_Alert("This method has been called with an invalid number of parameters")
	
End if 
ERR_MethodTrackerReturn("SD2_DiaryEntry"; $_t_oldMethodName)
