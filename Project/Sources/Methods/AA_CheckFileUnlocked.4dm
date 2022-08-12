//%attributes = {}

If (False:C215)
	//Project Method Name:      AA_CheckFileUnlocked
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK; $_bo_UseNegative; $_bo_OK; $_bo_UseNegative)
	C_LONGINT:C283($_l_Delay; $_l_Difference; $_l_FieldNumber; $_l_ItemRef; $_l_Repeats; $_l_TableNumber; $_l_Tries; $_l_Delay; $_l_Difference; $_l_FieldNumber; $_l_ItemRef)
	C_LONGINT:C283($_l_Repeats; $_l_TableNumber; $_l_Tries)
	C_OBJECT:C1216($_obj_Identifiers)
	C_POINTER:C301($_Ptr_VarOrField; $1; $_Ptr_VarOrField; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_OldSemaphoreName; $_t_OldSemaphoreName2; $_t_RefContextual; $_t_SemaphoreName; $_t_SemaphoreName2; $_t_VariableName; DB_t_Methodname; Sem_t_SemaphoreName; Sem_t_SemaphoreName2; $_t_oldMethodName)
	C_TEXT:C284($_t_OldSemaphoreName; $_t_OldSemaphoreName2; $_t_RefContextual; $_t_SemaphoreName; $_t_SemaphoreName2; $_t_VariableName; DB_t_Methodname; Sem_t_SemaphoreName; Sem_t_SemaphoreName2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_CheckFileUnlocked")


DB_t_Methodname:=Current method name:C684
If (Count parameters:C259>=1)
	$_t_OldSemaphoreName2:=Sem_t_SemaphoreName2
	$_t_OldSemaphoreName:=Sem_t_SemaphoreName
	$_Ptr_VarOrField:=$1
	If (Not:C34(In transaction:C397))
		If (GenValidatePointer($_Ptr_VarOrField))
			If (Is a variable:C294($_Ptr_VarOrField))
				If (Type:C295($_Ptr_VarOrField->)=0) | (Type:C295($_Ptr_VarOrField->)=2)
					Sem_t_SemaphoreName2:="Busy_"+$_Ptr_VarOrField->
				Else 
					RESOLVE POINTER:C394($_Ptr_VarOrField; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					Sem_t_SemaphoreName2:="Busy_"+$_t_VariableName
				End if 
				$_t_SemaphoreName2:=Sem_t_SemaphoreName2
				Sem_t_SemaphoreName:=""
				// search using the identifi
				$_obj_Identifiers:=ds:C1482.IDENTIFIERS.query("XRef_FIELD =:1"; -1)
				
				
			Else 
				$_l_TableNumber:=Table:C252($_Ptr_VarOrField)
				Sem_t_SemaphoreName2:="Busy_"+String:C10($_l_TableNumber)
				Sem_t_SemaphoreName:="Save_"+String:C10($_l_TableNumber)
				$_t_SemaphoreName2:=Sem_t_SemaphoreName2
				$_t_SemaphoreName:=Sem_t_SemaphoreName
				$_bo_UseNegative:=False:C215
				$_l_TableNumber:=Table:C252($_Ptr_VarOrField)
				Case of 
					: ($_l_TableNumber<254)
						$_l_TableNumber:=Table:C252($_Ptr_VarOrField) << 24  //shift the number 24 bits to the left
						
						If ($_l_TableNumber<0)
							$_bo_UseNegative:=True:C214  //This is after table 127... so the number is an overflow. this will work up to table 254..which is enough for daybook
							$_l_Difference:=Table:C252($_Ptr_VarOrField)-127
							$_l_TableNumber:=$_l_Difference << 24  //shift the number 24 bits to the left
						End if 
						$_l_FieldNumber:=Field:C253($1)
						$_l_ItemRef:=$_l_TableNumber | $_l_FieldNumber
						//NG there has to be a better way than this.
						
						If ($_bo_UseNegative)
							$_l_ItemRef:=0-$_l_ItemRef
						End if 
						If (In transaction:C397) & (Read only state:C362([IDENTIFIERS:16])=False:C215)
							UNLOAD RECORD:C212([IDENTIFIERS:16])
							READ ONLY:C145([IDENTIFIERS:16])
							
							
						End if 
						
						$_obj_Identifiers:=ds:C1482.IDENTIFIERS.query("XRef_FIELD =:1"; $_l_ItemRef)
						
						
						//QUERY([IDENTIFIERS];[IDENTIFIERS]XRef_FIELD=$_l_ItemRef)
						
						
					Else 
						$_t_RefContextual:=Table name:C256($_l_TableNumber)
						
						$_l_FieldNumber:=Field:C253($1)
						$_l_ItemRef:=$_l_TableNumber | $_l_FieldNumber
						//NG there has to be a better way than this.
						
						If ($_bo_UseNegative)
							$_l_ItemRef:=0-$_l_ItemRef
						End if 
						If (In transaction:C397) & (Read only state:C362([IDENTIFIERS:16])=False:C215)
							UNLOAD RECORD:C212([IDENTIFIERS:16])
							READ ONLY:C145([IDENTIFIERS:16])
							
							
						End if 
						
						$_obj_Identifiers:=ds:C1482.IDENTIFIERS.query("XRef_FIELD =:1"; $_l_ItemRef)
						
						
						//QUERY([IDENTIFIERS];[IDENTIFIERS]XRef_FIELD=$_l_ItemRef)
						
						
				End case 
			End if 
			
			
			
			$_l_Repeats:=0
			$_l_Delay:=1
			$_l_Tries:=0
			//If (Not(In transaction))
			If ($_obj_Identifiers.length>0)
				If (Not:C34(In transaction:C397))
					Repeat 
						$_l_Tries:=$_l_Tries+1
						$_l_Repeats:=$_l_Repeats+1
						$_bo_OK:=Check_Locked(->[IDENTIFIERS:16]; 1)
						If (Not:C34($_bo_OK))
							If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))  //only increase every 10 tries
								$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
							End if 
							DelayTicks(2*$_l_Delay)
							If (Not:C34($_bo_OK))
								// BEEP
							End if 
							If (In transaction:C397) & ($_l_Tries>100)  //There is a problem so break out
								
								
								$_bo_OK:=True:C214
							End if 
						End if 
						
					Until ($_bo_OK=True:C214)
					//UNLOAD RECORD([IDENTIFIERS])
					//REDUCE SELECTION([IDENTIFIERS];0)
					$_obj_Identifiers[0].unlock()
				End if 
			End if 
			
			//End if
			
			If ($_t_SemaphoreName2#"")
				CLEAR SEMAPHORE:C144($_t_SemaphoreName2)
			End if 
			
			If (Sem_t_SemaphoreName#"")
				CLEAR SEMAPHORE:C144($_t_SemaphoreName)
				
			End if 
			
		End if 
	End if 
End if 
Sem_t_SemaphoreName2:=$_t_OldSemaphoreName2
Sem_t_SemaphoreName:=$_t_OldSemaphoreName
ERR_MethodTrackerReturn("AA_CheckFileUnlocked"; $_t_oldMethodName)
