//%attributes = {}

If (False:C215)
	//Project Method Name:      AA_JUNK100
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  01/05/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_FormNames; 0)
	ARRAY TEXT:C222($_at_Paths; 0)
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_Index3; $_l_LastTable)
	C_POINTER:C301($_Ptr_Table)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 11/10/2013 11:11
	//Method Name: AA_JUNK100
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("AA_JUNK100")

If (True:C214)
	ARRAY TEXT:C222($_at_Paths; 0)
	If (True:C214)
		If (True:C214)
			METHOD GET PATHS:C1163(2; $_at_Paths)  //Database methods
			
			
			For ($_l_Index; 1; Size of array:C274($_at_Paths))
				MESSAGE:C88("Database methods "+String:C10($_l_Index)+" of "+String:C10(Size of array:C274($_at_Paths)))
				
				DB_Get_Designer($_at_Paths{$_l_Index}; True:C214)
				
			End for 
			
			METHOD GET PATHS:C1163(1; $_at_Paths)  // Project methods
			
		End if 
		For ($_l_Index; 1; Size of array:C274($_at_Paths))
			MESSAGE:C88("Project methods "+String:C10($_l_Index)+" of "+String:C10(Size of array:C274($_at_Paths)))
			
			DB_Get_Designer($_at_Paths{$_l_Index}; True:C214)
		End for 
		
		METHOD GET PATHS:C1163(8; $_at_Paths)  //triggers
		
		For ($_l_Index; 1; Size of array:C274($_at_Paths))
			MESSAGE:C88("trigger methods "+String:C10($_l_Index)+" of "+String:C10(Size of array:C274($_at_Paths)))
			
			DB_Get_Designer($_at_Paths{$_l_Index}; True:C214)
		End for 
		
	End if 
	If (True:C214)
		METHOD GET PATHS:C1163(4; $_at_Paths)  //Project Form Methods
		
		For ($_l_Index; 1; Size of array:C274($_at_Paths))
			MESSAGE:C88("Form Ojbect methods "+String:C10($_l_Index)+" of "+String:C10(Size of array:C274($_at_Paths)))
			
			DB_Get_Designer($_at_Paths{$_l_Index}; True:C214)
		End for 
	End if 
	$_l_LastTable:=Get last table number:C254
	
	For ($_l_Index; 1; $_l_LastTable)
		If (Is table number valid:C999($_l_Index))
			ARRAY TEXT:C222($_at_FormNames; 0)
			$_Ptr_Table:=Table:C252($_l_Index)
			FORM GET NAMES:C1167($_Ptr_Table->; $_at_FormNames; *)
			
			For ($_l_Index2; 1; Size of array:C274($_at_FormNames))
				METHOD GET PATHS FORM:C1168($_Ptr_Table->; $_at_Paths; $_at_FormNames{$_l_Index2}; *)
				
				For ($_l_Index3; 1; Size of array:C274($_at_Paths))
					MESSAGE:C88("Form Objects methods. Table:"+String:C10($_l_Index)+" of "+String:C10($_l_LastTable)+"Form "+String:C10($_l_Index2)+" of "+String:C10(Size of array:C274($_at_FormNames))+"Object "+String:C10($_l_Index3)+" of "+String:C10(Size of array:C274($_at_Paths)))
					
					
					DB_Get_Designer($_at_Paths{$_l_Index3}; True:C214)
					
				End for 
				
				
			End for 
			
		End if 
	End for 
	
End if 
Gen_Alert("SEEDING DONE")


ERR_MethodTrackerReturn("AA_JUNK100"; $_t_oldMethodName)
