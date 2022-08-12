//%attributes = {}

If (False:C215)
	//------------------ Revision Control ----------------
	//Date Created:  23/10/2013 12:27
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Access; $_bo_Modified; $_bo_Modified2; DB_bo_RecordModified; vMod2)
	C_LONGINT:C283($_l_Mode; $1; $2; $3)
	C_POINTER:C301($_Ptr_Table; $14; $15; $18; $19; $6; $7; $8; $9; vFilePtr)
	C_REAL:C285($0; $16; $17)
	C_TEXT:C284($_t_ExecuteMethodName; $_t_oldMethodName; $_t_oldMethodName2; $_t_Title11; $10; $11; $12; $13; $4; $5; vTitle11)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Sel_CrossTable")


$0:=0
$_t_Title11:=vTitle11
$_bo_Modified:=DB_bo_RecordModified
$_bo_Modified2:=vMod2
If (Count parameters:C259>=11)
	DB_bo_RecordModified:=($11="One")
	$_bo_Access:=True:C214
	$_l_Mode:=0
	If (Count parameters:C259>=16)  // If Mode=-1 we are creating a query and if 2 we are editing
		//actually it will never be 2 in here
		$_l_Mode:=$16
	End if 
	
	If (Count parameters:C259<15)
		$_Ptr_Table:=vFilePtr
	Else 
		//$15 is a pointer to a field in the target table
		$_Ptr_Table:=Table:C252(Table:C252($15))
	End if 
	
	If ($1>0)
		If ($2=0)
			$_bo_Access:=Check_ModMess($1)
		Else 
			If ($3=0)
				$_bo_Access:=Check_ModMess($1; $2)
			End if 
		End if 
	End if 
	If ($_bo_Access)
		If ($_l_Mode=0) | (True:C214)
			If ($5#"")
				Sel_SetAny2($4; $5; $6; $_Ptr_Table)
			Else 
				CREATE SET:C116($_Ptr_Table->; $4)
			End if 
		End if 
		If (Count parameters:C259<15)
			//DEFAULT TABLE($7->)  //all the searches have been modified to not need default table set
		End if 
		
		
		$8->:=1
		If ($10="Search")
			QUERY:C277($7->)
			//need to test here is we can pick up a document with the search
		Else 
			$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$10)
			If (Count parameters:C259<19)
				//EXECUTE FORMULA($10)
				$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($10)
				EXECUTE METHOD:C1007($_t_ExecuteMethodName)
			Else 
				
				SM_L_AutoSearchbyID($16; $18; $19; Table:C252($7))
				
			End if 
		End if 
		If (Count parameters:C259<15)
			//DEFAULT TABLE($_Ptr_Table->)
		End if 
		If ($_l_Mode=0)
			If ($8->=1)
				//Note that even though we are passing a pointer in $14 and 15 the system will go into this execute if $11 is not empty
				If (($11#"") & ($11#"One") & ($11#"Many"))
					//$11 is a specific relationship-the method must state not assume the table of the set
					//
					//$_t_oldMethodName2:=ERR_MethodTracker ("Execute: "+$11)
					//EXECUTE FORMULA($11)//
					$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($11)
					EXECUTE METHOD:C1007($_t_ExecuteMethodName)
				Else 
					If (Count parameters:C259>=15)
						If ($11="One")
							If (vMod2)
								Sel_CFCalcRel($_Ptr_Table; $7; $14; $4; $15)
							Else 
								Load_OneFast($7; $14; $_Ptr_Table; $15; $4)
							End if 
							
						Else 
							If ($11="Many")
								Load_ManyFast($7; $14; $4; $15; $_Ptr_Table)
							End if 
						End if 
					End if 
				End if 
			Else 
				USE SET:C118($4)
				CREATE SET:C116($_Ptr_Table->; "Master")
			End if 
		End if 
		$0:=$8->
		$8->:=0
		$9->:=1
		If ($_l_Mode=0)
			If ($12#"")
				//$_t_oldMethodName2:=ERR_MethodTracker ("Execute: "+$12)
				//EXECUTE FORMULA($12)
				$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($12)
				EXECUTE METHOD:C1007($_t_ExecuteMethodName)
			End if 
			If ($13#"")
				//$_t_oldMethodName2:=ERR_MethodTracker ("Execute: "+$13)
				//EXECUTE FORMULA($13)
				$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($13)
				EXECUTE METHOD:C1007($_t_ExecuteMethodName)
			End if 
			If ($5#"")
				
				Sel_SetAny3($5; $6; $_Ptr_Table)
			End if 
		Else 
			USE SET:C118($4)
			CREATE SET:C116($_Ptr_Table->; "Master")
			If ($5#"")
				
				Sel_SetAny3($5; $6; $_Ptr_Table)
			End if 
			
		End if 
		
	End if 
	DB_bo_RecordModified:=$_bo_Modified
	vMod2:=$_bo_Modified2
	vTitle11:=$_t_Title11
End if 
ERR_MethodTrackerReturn("Sel_CrossTable"; $_t_oldMethodName)
