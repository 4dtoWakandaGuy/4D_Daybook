//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_UpdateArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/01/2011 17:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_SetContextIDs; 0)
	ARRAY LONGINT:C221($_al_SetContextItemContextID; 0)
	ARRAY LONGINT:C221($_al_SetitemsClassID; 0)
	ARRAY LONGINT:C221($_al_SetitemsID; 0)
	//ARRAY LONGINT(SM_al_SetContextIDs;0)
	//ARRAY LONGINT(SM_al_SetContextItemContextID;0)
	//ARRAY LONGINT(SM_al_SetGroupItemClassIDs;0)
	//ARRAY LONGINT(SM_al_SetGroupItemContextIDs;0)
	//ARRAY LONGINT(SM_al_SetGroupItemIDs;0)
	//ARRAY LONGINT(SM_al_SetitemsClassID;0)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	ARRAY TEXT:C222($_at_SetContexts; 0)
	ARRAY TEXT:C222($_at_SetItemsName; 0)
	//ARRAY TEXT(SM_at_SetContextitemOwnerIDs;0)
	//ARRAY TEXT(SM_at_SetContexts;0)
	//ARRAY TEXT(SM_at_SetGroupItemClassNames;0)
	//ARRAY TEXT(SM_at_SetGroupItemNames;0)
	//ARRAY TEXT(SM_at_SetGroupItemOwnerIDs;0)
	//ARRAY TEXT(SM_at_SetGroupitemSharesList;0)
	//ARRAY TEXT(SM_at_SetitemsClassName;0)
	//ARRAY TEXT(SM_at_SetitemSharesList;0)
	//ARRAY TEXT(SM_at_SetItemsName;0)
	C_BOOLEAN:C305($_bo_Add; $11)
	C_LONGINT:C283($_l_ContextRow; $_l_GroupIDRow; $_l_InsertPoint; $_l_ItemRow; $_l_SetContextIDs; $_l_SetContextItemContextID; $_l_SetitemsClassID; $_l_SetitemsID)
	C_POINTER:C301($_ptr_ClassIDSArray; $_ptr_ClassNamesArray; $_ptr_ContextOwnerIDarray; $_ptr_ContextsArray; $_ptr_ContextsIDSArray; $_ptr_SetItemsArray; $_ptr_SetItemsContextIDArray; $_ptr_SetItemsIDSarray; $_ptr_SharesListarray)
	C_REAL:C285($3; $4; $6; $8)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_SetContexts; $_t_SetitemsClassName; $_t_SetItemsName; $1; $10; $2; $5; $7; $9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_UpdateArrays")
//This Method will update the arrays associated with the on screen
//representation of the HL
//it does not save the data to the database
//the data is sent in the following parameters
//$1 =owner to update
//this is so we can re-use this code for managing the grp and UNI arrays as well
//$1=PER
//$1=GRP
//$1=UNI
//to update an item pass the item value id and context in in $2,$3,$4
//to update a context pass the context value and ID in $5,$6
//to update the class(and therefore the ICON used pass the CLass and iD in $7 $8
//you can pass values in $7 and $8 at the same time as $2 $3 and $4
//pass empty string in $5 and 0 in $6 if you are doing this
//to update an item owner
//pass a different owner in $1 and pass the item values in $2 $3 $4
//Note that you cannot set a context owner using this method
//(CONTEXT DO NOT STORE AN OWNER ID)
// THE ARRAYS FOR THE PERSON ARE UPDATED
//CALL SM_UPDATEDATA TO UPDATE THE SAVED DATA
//ON EXIT THERE IS A CALL TO THE PROCESS WHICH WILL CAUSE THIS TO HAPPEN
//$9 IS A PERSON OR GROUP TO OWN this list and $10 is the list of shares-this list is really only validated on the OWNERS list if it is changed, it would not matter if it was not correct on someone elses sets.
//$11-pass TRUE in $11 to Remove a
If (Count parameters:C259>=11)
	$_bo_Add:=(Not:C34($11))  //Delete
Else 
	$_bo_Add:=True:C214  //add or update
End if 
If (Count parameters:C259>=4)
	//
	If ($1="PER") | ($1="UNI") | ($1="GRP")
		$_ptr_ContextsArray:=->SM_at_SetContexts
		$_ptr_ContextsIDSArray:=->SM_al_SetContextIDs
		$_ptr_SetItemsArray:=->SM_at_SetItemsName
		$_ptr_SetItemsContextIDArray:=->SM_al_SetContextItemContextID
		$_ptr_SetItemsIDSarray:=->SM_al_SetitemsID
		$_ptr_ClassNamesArray:=->SM_at_SetitemsClassName
		$_ptr_ClassIDSArray:=->SM_al_SetitemsClassID
		$_ptr_ContextOwnerIDarray:=->SM_at_SetContextitemOwnerIDs
		$_ptr_SharesListarray:=->SM_at_SetitemSharesList
		//trace$p10:=
		Case of 
			: (Count parameters:C259=4)
				$_t_SetItemsName:=$2
				$_l_SetitemsID:=$3
				$_l_SetContextItemContextID:=$4
				$_t_SetContexts:=""
				$_l_SetContextIDs:=0
				$_t_SetitemsClassName:=""
				$_l_SetitemsClassID:=0
			: (Count parameters:C259=5)
				$_t_SetItemsName:=$2
				$_l_SetitemsID:=$3
				$_l_SetContextItemContextID:=$4
				$_t_SetContexts:=$5
				$_l_SetContextIDs:=0  //UNKOWN ID-MAYBE A NEW CONTEXT?????
				//ACTUALLY NOT PRACTICAL TO WORK OUT
				//AS WE NEED THE TABLE NUMBER FOR A CONTEXT TO
				//SO DONT DO IT
				$_t_SetitemsClassName:=""
				$_l_SetitemsClassID:=0
			: (Count parameters:C259=6)
				$_t_SetItemsName:=$2
				$_l_SetitemsID:=$3
				$_l_SetContextItemContextID:=$4
				$_t_SetContexts:=$5
				$_l_SetContextIDs:=$6
				$_t_SetitemsClassName:=""
				$_l_SetitemsClassID:=0
			: (Count parameters:C259=7)
				$_t_SetItemsName:=$2
				$_l_SetitemsID:=$3
				$_l_SetContextItemContextID:=$4
				$_t_SetContexts:=$5
				$_l_SetContextIDs:=$6
				$_t_SetitemsClassName:=$7
				$_l_SetitemsClassID:=0  //UNKOWN CLASS!!!
				//IF THE CLASS IN $7 IS UNKOWN THEN THIS IS BUGGY
			: (Count parameters:C259>=8)
				$_t_SetItemsName:=$2
				$_l_SetitemsID:=$3
				$_l_SetContextItemContextID:=$4
				$_t_SetContexts:=$5
				$_l_SetContextIDs:=$6
				$_t_SetitemsClassName:=$7
				$_l_SetitemsClassID:=$8
				
		End case 
		If ($_t_SetItemsName#"") & ($_l_SetitemsID#0) & ($_l_SetContextItemContextID#0)  //B0
			//AN ITEM IS TO BE ADDED/MODIFIED
			//FIRST CHECK THE CONTEXT EXISTS OR WE WILL HAVE A PROBLEM LATER
			$_l_ContextRow:=Find in array:C230($_ptr_ContextsIDSArray->; $_l_SetContextItemContextID)
			If ($_l_ContextRow<0)
				APPEND TO ARRAY:C911($_ptr_ContextsIDSArray->; $_l_SetContextItemContextID)
				APPEND TO ARRAY:C911($_ptr_ContextsArray->; $_t_SetContexts)
				$_l_ContextRow:=Size of array:C274($_ptr_ContextsArray->)
			End if 
			
			If ($_l_ContextRow>0)
				$_l_ItemRow:=Find in array:C230($_ptr_SetItemsIDSarray->; $_l_SetitemsID)
				If ($_l_ItemRow<0)  //B2
					If ($_bo_Add)
						$_l_ItemRow:=Size of array:C274($_ptr_SetItemsArray->)+1
						INSERT IN ARRAY:C227($_ptr_SetItemsArray->; $_l_ItemRow; 1)  //
						INSERT IN ARRAY:C227($_ptr_SetItemsContextIDArray->; $_l_ItemRow; 1)
						INSERT IN ARRAY:C227($_ptr_SetItemsIDSarray->; $_l_ItemRow; 1)
						INSERT IN ARRAY:C227($_ptr_ClassNamesArray->; $_l_ItemRow; 1)
						INSERT IN ARRAY:C227($_ptr_ClassIDSArray->; $_l_ItemRow; 1)
						INSERT IN ARRAY:C227($_ptr_ContextOwnerIDarray->; $_l_ItemRow; 1)
						INSERT IN ARRAY:C227($_ptr_SharesListarray->; $_l_ItemRow; 1)
					End if 
				Else 
					If (Not:C34($_bo_Add))  //` if $_bo_Add is false we are deleting
						
						DELETE FROM ARRAY:C228($_ptr_SetItemsArray->; $_l_ItemRow; 1)  //
						DELETE FROM ARRAY:C228($_ptr_SetItemsContextIDArray->; $_l_ItemRow; 1)
						DELETE FROM ARRAY:C228($_ptr_SetItemsIDSarray->; $_l_ItemRow; 1)
						DELETE FROM ARRAY:C228($_ptr_ClassNamesArray->; $_l_ItemRow; 1)
						DELETE FROM ARRAY:C228($_ptr_ClassIDSArray->; $_l_ItemRow; 1)
						DELETE FROM ARRAY:C228($_ptr_ContextOwnerIDarray->; $_l_ItemRow; 1)
						DELETE FROM ARRAY:C228($_ptr_SharesListarray->; $_l_ItemRow; 1)
						//if the item is belonging to GRP we also need to delete from there
						$_l_GroupIDRow:=Find in array:C230(SM_al_SetGroupItemIDs; $_l_SetitemsID)
						If ($_l_GroupIDRow>0)  //if there is a group set-old type and it is owned by this user delete that array as well..See the save method
							
							If (Position:C15(("_"+<>PER_t_CurrentUserInitials+":"); SM_at_SetGroupItemOwnerIDs{$_l_GroupIDRow})>0)
								//
								DELETE FROM ARRAY:C228(SM_at_SetGroupItemNames; $_l_GroupIDRow; 1)
								DELETE FROM ARRAY:C228(SM_al_SetGroupItemIDs; $_l_GroupIDRow; 1)
								DELETE FROM ARRAY:C228(SM_al_SetGroupItemContextIDs; $_l_GroupIDRow; 1)
								DELETE FROM ARRAY:C228(SM_at_SetGroupItemClassNames; $_l_GroupIDRow; 1)
								DELETE FROM ARRAY:C228(SM_al_SetGroupItemClassIDs; $_l_GroupIDRow; 1)
								DELETE FROM ARRAY:C228(SM_at_SetGroupItemOwnerIDs; $_l_GroupIDRow; 1)
								DELETE FROM ARRAY:C228(SM_at_SetGroupitemSharesList; $_l_GroupIDRow; 1)
							End if 
						End if 
					End if 
				End if   //end B2
				If ($_bo_Add)  //B1
					$_ptr_SetItemsArray->{$_l_ItemRow}:=$_t_SetItemsName
					$_ptr_SetItemsIDSarray->{$_l_ItemRow}:=$_l_SetitemsID
					$_ptr_SetItemsContextIDArray->{$_l_ItemRow}:=$_l_SetContextItemContextID
					If ($_t_SetitemsClassName#"") & ($_l_SetitemsClassID#0)  //B3
						$_ptr_ClassNamesArray->{$_l_ItemRow}:=$_t_SetitemsClassName
						$_ptr_ClassIDSArray->{$_l_ItemRow}:=$_l_SetitemsClassID
					Else 
						If ($_ptr_ClassIDSArray->{$_l_ItemRow}=0)  //B4
							//When we are adding an item it the class is not set
							//we must set it to default
							$_ptr_ClassNamesArray->{$_l_ItemRow}:="Fixed List"
							$_ptr_ClassIDSArray->{$_l_ItemRow}:=853
							
						End if   //END B4
						
					End if   //END B3
					//and the owner was passed in $1
					Case of   //B5 Case
						: ($1="PER")
							If (Count parameters:C259<9)
								$_ptr_ContextOwnerIDarray->{$_l_ItemRow}:=<>PER_t_CurrentUserInitials
							Else 
								If ($9#"")
									$_ptr_ContextOwnerIDarray->{$_l_ItemRow}:=$9
								Else 
									$_ptr_ContextOwnerIDarray->{$_l_ItemRow}:=<>PER_t_CurrentUserInitials
								End if 
								
							End if 
							If (Count parameters:C259>=10)
								
								$_ptr_SharesListarray->{$_l_ItemRow}:=$10
							End if 
							
						: ($1="GRP")  //Actually now a set will never be OWNED by a group. it will just be SHARED with the group.
							//SM person Group is set in GEN_SetManger
							//and would need to be set by another method that wanted to call this method
							If (Count parameters:C259<9)
								$_ptr_ContextOwnerIDarray->{$_l_ItemRow}:="GRP_"+<>PER_t_CurrentUserInitials+":"+SM_PersonGroup
							Else 
								If ($9#"")
									$_ptr_ContextOwnerIDarray->{$_l_ItemRow}:="GRP_"+<>PER_t_CurrentUserInitials+":"+$9
								Else 
									$_ptr_ContextOwnerIDarray->{$_l_ItemRow}:="GRP_"+<>PER_t_CurrentUserInitials+":"+SM_PersonGroup
								End if 
							End if 
						: ($1="UNI")
							$_ptr_ContextOwnerIDarray->{$_l_ItemRow}:="UNI"
					End case   //End B5 Case
				End if 
			Else   //ELSE B1
				
				//  ALERT("Method SM_UpdateArrays has been passed an incorrect VALUE IN $4")
				Gen_Alert("Method SM_UpdateArrays has been passed an incorrect VALUE IN $4.")
			End if   //END IF B1
		Else   //ELSE B0
			If ($_l_SetitemsID#0) & ($_t_SetitemsClassName#"") & ($_l_SetitemsClassID#0)  //`D1
				$_l_InsertPoint:=Find in array:C230($_ptr_SetItemsIDSarray->; $_l_SetitemsID)
				If ($_l_InsertPoint>0)  //D2
					$_ptr_ClassNamesArray->{$_l_InsertPoint}:=$_t_SetitemsClassName
					$_ptr_ClassIDSArray->{$_l_InsertPoint}:=$_l_SetitemsClassID
				Else   //D2
					//  ALERT("Method SM_UpdateArrays has been passed an incorrect VALUE IN $3")
					Gen_Alert("Method SM_UpdateArrays has been passed an incorrect VALUE IN $3.")
				End if   //D2
			End if   //ENd D1
			
			
			
		End if   //END B0
		If ($_t_SetContexts#"") & ($_l_SetContextIDs#0)  //C1
			//add/Modify a context
			If ($_l_SetContextIDs>10000)  //C2
				$_l_ContextRow:=Find in array:C230($_ptr_ContextsIDSArray->; $_l_SetContextIDs)
				If ($_l_ContextRow<0)  //C3
					$_l_InsertPoint:=Size of array:C274($_ptr_ContextsIDSArray->)+1
					INSERT IN ARRAY:C227($_ptr_ContextsIDSArray->; $_l_InsertPoint; 1)
					INSERT IN ARRAY:C227($_ptr_ContextsArray->; $_l_InsertPoint; 1)
				Else 
					$_l_InsertPoint:=$_l_ContextRow
				End if   //End C3
				$_ptr_ContextsIDSArray->{$_l_InsertPoint}:=$_l_SetContextIDs
				$_ptr_ContextsArray->{$_l_InsertPoint}:=$_t_SetContexts
			Else   //ELSE C2
				//   ALERT("Method SM_UpdateArrays has been passed an incorrect VALUE IN $6")
				Gen_Alert("Method SM_UpdateArrays has been passed an incorrect VALUE IN $6.")
			End if   //END C2
			
		End if   //END C1
		
		
	Else 
		// ALERT("Method SM_UpdateArrays has been passed an incorrect VALUE IN $1")
		Gen_Alert("Method SM_UpdateArrays has been passed an incorrect VALUE IN $1.")
	End if 
	
End if 
ERR_MethodTrackerReturn("SM_UpdateArrays"; $_t_oldMethodName)
