//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_SetNextID
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/05/2010 21:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>ResetNumber; <>SYS_bo_QuitCalled; $_bo_UseNegative)
	C_LONGINT:C283($_l_FieldNumber; $_l_ItemReference; $_l_OffsetDIfference; $_l_SeededNumber; $_l_SemaphoreTrap; $_l_TableNumber; $1; $2; $3; $4)
	C_POINTER:C301($_ptr_Field; $_ptr_Table)
	C_TEXT:C284($_t_oldMethodName; SEM_t_GetID)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_SetNextID")
//this is a fixing method.

If (False:C215)  //dont uncomment this!!!!!!
	// it is to fix the following problem
	
	
End if 
//this is called as a process.
//$1 is a table number
//$2 is a field number.
//This will find the HIGHEST value in the data
//$4 is the seed to take away
//note this can only work for numbers related to fields!
If (Count parameters:C259>=4)
	If ($1>0)
		$_bo_UseNegative:=False:C215
		$_l_TableNumber:=$1 << 24  //shift the number 24 bits to the left
		If ($_l_TableNumber<0)
			$_bo_UseNegative:=True:C214
			//This is after table 127... so the number is an overflow. this will work up to table 254..which is enough for daybook
			$_l_OffsetDIfference:=$1-127
			$_l_TableNumber:=$_l_OffsetDIfference << 24  //shift the number 24 bits to the left
			
		End if 
		
		$_l_FieldNumber:=$2
		$_l_ItemReference:=$_l_TableNumber | $_l_FieldNumber
		If ($_bo_UseNegative)
			$_l_ItemReference:=0-$_l_ItemReference
		End if 
		SEM_t_GetID:="ID_"+String:C10($_l_ItemReference)
		$_l_SemaphoreTrap:=0
		While (Semaphore:C143(SEM_t_GetID)) & (Not:C34(<>SYS_bo_QuitCalled)) & ($_l_SemaphoreTrap<1000)
			If ($_l_SemaphoreTrap>10)
				//MESSAGE("Called from"+$_t_oldMethodName)
			End if 
			DelayTicks
			$_l_SemaphoreTrap:=$_l_SemaphoreTrap+1
		End while 
		
		$_ptr_Table:=Table:C252($1)
		$_ptr_Field:=Field:C253($1; $2)
		QUERY:C277($_ptr_Table->; $_ptr_Field->>$3)
		ORDER BY:C49($_ptr_Table->; $_ptr_Field->; <)
		$_l_SeededNumber:=$_ptr_Field->
		READ WRITE:C146([IDENTIFIERS:16])
		//TRACE
		QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]XRef_FIELD:8=$_l_ItemReference)
		[IDENTIFIERS:16]Number:2:=($_l_SeededNumber-$4)+1
		If (In transaction:C397)
			//MESSAGE("Called from"+$_t_oldMethodName)
		End if 
		
		DB_SaveRecord(->[IDENTIFIERS:16])
		UNLOAD RECORD:C212([IDENTIFIERS:16])
		CLEAR SEMAPHORE:C144(SEM_t_GetID)
		<>ResetNumber:=True:C214
	End if 
	
End if 
ERR_MethodTrackerReturn("AA_SetNextID"; $_t_oldMethodName)
