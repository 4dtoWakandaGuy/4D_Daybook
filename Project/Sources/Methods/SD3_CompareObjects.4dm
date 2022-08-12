//%attributes = {}

If (False:C215)
	//Project Method Name:      SD3_CompareObjects
	//------------------ Method Notes ------------------
	// Created #5-11-2014 by Vincent de Lachaux
	//------------------ Revision Control ----------------
	//Date Created:  02/01/2020
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_sourceTypes; 0)
	ARRAY LONGINT:C221($_al_TargetTypes; 0)
	ARRAY OBJECT:C1221($_aobj_SourceArray; 0)
	ARRAY OBJECT:C1221($_aobj_TargetArray; 0)
	ARRAY TEXT:C222($_at_SourceProperties; 0)
	ARRAY TEXT:C222($_at_TargetProperties; 0)
	ARRAY TEXT:C222($_at_TextSource; 0)
	ARRAY TEXT:C222($_at_TextTarget; 0)
	C_BOOLEAN:C305($_bo_Equal; $0)
	C_LONGINT:C283($_l_CountParameters; $_l_CountProperties; $_l_LongintItemCount; $_l_LongintValue; $_l_LongintValue2)
	C_OBJECT:C1216($_obj_Source; $_obj_SourceOjbect; $_obj_Target; $_obj_targetObject; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD3_CompareObjects")





// ----------------------------------------------------
// Initialisations
$_l_CountParameters:=Count parameters:C259

If (Asserted:C1132($_l_CountParameters>=2; "Missing parameter"))
	
	//Required parameters
	$_obj_Source:=$1
	$_obj_Target:=$2
	
	//Optional parameters
	If ($_l_CountParameters>=3)
		
		// <NONE>
		
	End if 
	
	OB GET PROPERTY NAMES:C1232($_obj_Source; $_at_SourceProperties; $_al_sourceTypes)
	OB GET PROPERTY NAMES:C1232($_obj_Target; $_at_TargetProperties; $_al_TargetTypes)
	
	$_l_CountProperties:=Size of array:C274($_at_SourceProperties)
	
Else 
	
	ABORT:C156
	
End if 

// ----------------------------------------------------
//if the count of properties is the same
If ($_l_CountProperties=Size of array:C274($_at_TargetProperties))
	
	//the order of properties is not determined.
	//so we have to sort the arrays
	SORT ARRAY:C229($_at_SourceProperties; $_al_sourceTypes)
	SORT ARRAY:C229($_at_TargetProperties; $_al_TargetTypes)
	
	//compare the contents of each properties
	For ($_l_LongintValue; 1; $_l_CountProperties)
		
		//first, the name and the type, then its content if any
		Case of 
				
			: ($_at_SourceProperties{$_l_LongintValue}#$_at_TargetProperties{$_l_LongintValue})
				
				$_bo_Equal:=False:C215
				
			: ($_al_sourceTypes{$_l_LongintValue}#$_al_TargetTypes{$_l_LongintValue})
				
				$_bo_Equal:=False:C215
				
			: ($_al_sourceTypes{$_l_LongintValue}=Is object:K8:27)
				
				//compare the two objects
				$_obj_SourceOjbect:=OB Get:C1224($_obj_Source; $_at_SourceProperties{$_l_LongintValue}; Is object:K8:27)
				$_obj_targetObject:=OB Get:C1224($_obj_Target; $_at_SourceProperties{$_l_LongintValue}; Is object:K8:27)
				$_bo_Equal:=SD3_CompareObjects($_obj_SourceOjbect; $_obj_targetObject)
			: ($_al_sourceTypes{$_l_LongintValue}=Object array:K8:28)
				
				//as the type may not be uniform,
				//we have to get one array of objects and another of texts
				
				ARRAY OBJECT:C1221($_aobj_SourceArray; 0x0000)
				ARRAY OBJECT:C1221($_aobj_TargetArray; 0x0000)
				OB GET ARRAY:C1229($_obj_Source; $_at_SourceProperties{$_l_LongintValue}; $_aobj_SourceArray)
				OB GET ARRAY:C1229($_obj_Target; $_at_SourceProperties{$_l_LongintValue}; $_aobj_TargetArray)
				
				ARRAY TEXT:C222($_at_TextSource; 0x0000)
				ARRAY TEXT:C222($_at_TextTarget; 0x0000)
				OB GET ARRAY:C1229($_obj_Source; $_at_SourceProperties{$_l_LongintValue}; $_at_TextSource)
				OB GET ARRAY:C1229($_obj_Target; $_at_SourceProperties{$_l_LongintValue}; $_at_TextTarget)
				
				//verify the count of items
				$_l_LongintItemCount:=Size of array:C274($_aobj_SourceArray)
				$_bo_Equal:=($_l_LongintItemCount=Size of array:C274($_aobj_TargetArray))
				
				If ($_bo_Equal)
					
					For ($_l_LongintValue2; 1; $_l_LongintItemCount; 1)
						
						If (OB Is defined:C1231($_aobj_SourceArray{$_l_LongintValue2}))
							
							//compare the two objects
							$_bo_Equal:=SD3_CompareObjects($_aobj_SourceArray{$_l_LongintValue2}; $_aobj_TargetArray{$_l_LongintValue2})
						Else 
							//compare the two textual values
							$_bo_Equal:=($_at_TextSource{$_l_LongintValue2}=$_at_TextTarget{$_l_LongintValue2})
						End if 
						
						$_l_LongintValue2:=Choose:C955($_bo_Equal; $_l_LongintValue2; MAXLONG:K35:2-1)  //EXIT if false
						
					End for 
				End if 
				
			Else 
				//Compare two arrays
				
				//compare the two values
				///$_bo_Equal:=(OB Get($_obj_Source;$_at_SourceProperties{$_l_LongintValue})=OB Get($_obj_Target;$_at_SourceProperties{$_l_LongintValue}))
				
		End case 
		
		$_l_LongintValue:=Choose:C955($_bo_Equal; $_l_LongintValue; MAXLONG:K35:2-1)  //EXIT if false
		
	End for 
End if 

// ----------------------------------------------------
// Return
$0:=$_bo_Equal

// ----------------------------------------------------
// End
ERR_MethodTrackerReturn("SD3_CompareObjects"; $_t_oldMethodName)
