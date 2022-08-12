//%attributes = {}
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ListPropertyValues; 0)
	ARRAY TEXT:C222($_at_ListProperties; 0)
	ARRAY TEXT:C222($_at_ListPropertyValuesSTR; 0)
	C_BLOB:C604($_blb_ListValues)
	C_BOOLEAN:C305($_bo_Change; $_bo_Update)
	C_COLLECTION:C1488($_col_ListProperties)
	C_LONGINT:C283($_l_ListID; $_l_Number; $_l_Offset; $_l_Property; $_l_Reference; $_l_Tries)
	C_OBJECT:C1216($_obj_list; $_obj_Lists; $_obj_ListUsage; $_obj_ListUsages; $_obj_Match; $_obj_Save; $_obj_Status)
	C_TEXT:C284($_t_after; $_t_Before; $_t_ListAccess; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("AA_CheckHeirarchical")

// THEY WILL BE CHECKED AT STARTUP
If (Application type:C494=4D Server:K5:6) | (Application type:C494<4)
	
	
	$_l_Number:=0
	$_l_Number:=$_l_Number ?+ 4
	$_t_ListAccess:="Access:"+String:C10($_l_Number)+Char:C90(13)
	$_obj_ListUsages:=ds:C1482.x_ListUsage.query("x_TableID =:1 and x_FieldID =:2"; Table:C252(->[INFORMATION:55]); Field:C253(->[INFORMATION:55]QualityID:14))
	If ($_obj_ListUsages.length>0)
		$_obj_ListUsage:=$_obj_ListUsages[0]
		$_l_ListID:=$_obj_ListUsage.x_ListID
		$_t_Before:=""
		$_t_after:=""
		If ($_l_ListID>0)
			$_l_Tries:=0
			While (Semaphore:C143("LoadingListofLists"))  //about to write-stop everyone
				$_l_Tries:=$_l_Tries+1
				DelayTicks(2*$_l_Tries)
			End while 
			$_obj_Lists:=ds:C1482.X_LISTS.query("x_ID =:1"; $_l_ListID)
			If ($_obj_Lists.length>0)
				$_obj_list:=$_obj_Lists[0]
				If ($_obj_list.x_ListObject=Null:C1517)
					ARRAY TEXT:C222($_at_ListProperties; 0)
					ARRAY LONGINT:C221($_al_ListPropertyValues; 0)
					ARRAY TEXT:C222($_at_ListPropertyValuesSTR; 0)
					$_l_Offset:=0
					If (Not:C34($_obj_list.x_ListValues=Null:C1517))
						$_blb_ListValues:=$_obj_list.x_ListValues
						//the attributes must be in the old attributes blob. Note that this code was getting the data from the wrong place ?? maybe..
						BLOB TO VARIABLE:C533($_blb_ListValues; $_at_ListProperties; $_l_Offset)
						BLOB TO VARIABLE:C533($_blb_ListValues; $_al_ListPropertyValues; $_l_Offset)
						BLOB TO VARIABLE:C533($_blb_ListValues; $_at_ListPropertyValuesSTR; $_l_Offset)
					End if 
					C_COLLECTION:C1488($_col_ListProperties)
					$_col_ListProperties:=New collection:C1472
					For ($_l_Property; 1; Size of array:C274($_at_ListProperties))
						$_col_ListProperties.push(New object:C1471("PropertyName"; $_at_ListProperties{$_l_Property}; "NumericValue"; $_al_ListPropertyValues{$_l_Property}; "TextValue"; $_at_ListPropertyValuesSTR{$_l_Property}))
					End for 
					$_obj_list.x_ListObjects:=New object:C1471("Properties"; $_col_ListProperties)
					
					$_obj_Save:=$_obj_list.save(dk auto merge:K85:24)
					Case of 
						: ($_obj_Save.success)
						: ($_obj_Save.status=dk status automerge failed:K85:25)
							ALERT:C41($_obj_Save.statusText)
					End case 
				Else 
					$_col_ListProperties:=($_obj_list.x_ListObject.Properties)
					
				End if 
				//find in collection a property name "access"
				//$c2:=$c.find("FindCity";"Clanton")
				$_bo_Update:=False:C215
				$_obj_Match:=$_col_ListProperties.find("Gen_FindinCollection"; New object:C1471("attribute"; "PropertyName"; "attributevalue"; "ACCESS"))
				If ($_obj_Match=Null:C1517)  //no matching object
					//the old code did not update the record-which is wierd
					$_col_ListProperties.push(New object:C1471("PropertyName"; "ACCESS"; "NumericValue"; $_l_Number; "TextValue"; ""))
					$_bo_Update:=True:C214
				Else 
					If ($_obj_Match.NumericValue=0)
						$_obj_Match.NumericValue:=$_l_Number
						$_bo_Update:=True:C214
					End if 
				End if 
				If ($_bo_Update)
					$_obj_Save:=$_obj_list.save(dk auto merge:K85:24)
					Case of 
						: ($_obj_Save.success)
						: ($_obj_Save.status=dk status automerge failed:K85:25)
							ALERT:C41($_obj_Save.statusText)
					End case 
					
				End if 
			Else 
				//$_obj_ListUsages:=ds.x_ListUsage.query("x_TableID =:1 and x_FieldID =:2";Table(->[INFORMATION]);Field(->[INFORMATION]QualityID))
				$_obj_Status:=$_obj_ListUsage.drop(dk force drop if stamp changed:K85:17)
				Case of 
					: ($_obj_Status.success)
						//ALERT("You have dropped "+$employee.firstName+" "+$employee.lastName)  //The dropped entity remains in memory
					: ($_obj_Status.status=dk status entity does not exist anymore:K85:23)
						//ALERT($status.statusText)
				End case 
				//QUERY([x_ListUsage];[x_ListUsage]x_TableID=Table(->[INFORMATION]);*)
				//QUERY([x_ListUsage]; & ;[x_ListUsage]x_FieldID=Field(->[INFORMATION]QualityID))
				//DELETE SELECTION([x_ListUsage])
				//READ ONLY([x_ListUsage])
				
				
			End if 
		End if 
		
	End if 
	//QUERY([x_ListUsage]; [x_ListUsage]x_TableID=Table(->[INFORMATION]); *)
	//QUERY([x_ListUsage];  & ; [x_ListUsage]x_FieldID=Field(->[INFORMATION]QualityID))
End if 
ERR_MethodTrackerReturn("AA_CheckHeirarchical"; $_t_oldMethodName)
