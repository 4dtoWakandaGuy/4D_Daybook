//%attributes = {}

If (False:C215)
	//Project Method Name:      CheckMinorByObject
	//------------------ Method Notes ------------------
	//This method is to relace Check_MinorNC and CheckMinor
	//These two methods behaved as follows.
	//Check_Minor could have 8 parameters
	//passed the foloowing parameters
	//1 Pointer to field or varible containing the value to search for
	//2 Had multiple meanings it was the name of the variable which was then prefixed with a v(clearly part of this change is driven by the desire to use object names rather than variable names)
	//2 also could be the name of a 'document' (if $7 was not passed)
	//3 was a pointer to a table this was then used in the construction ot the usage code if 8 parameters were passed or directly the table to query for value in $1-> is not
	//4 was a field in table $3-> to query
	//5 was an alternative field to query. This was so it could search by code or name. so typically $4 was a pointer to the record(human visible) code and the $5 was a pointer to the name 
	//6 could be used to execute a method.-so to drive a specific query-but this would not include any parameters-i am going to look for an example. This would be used AFTER th initial query so like a filter..this section of the code has a false on so $6 was not used ever now
	//$7 was used as a record name-this or $2 could be used to when displaying a message about the record you were looking for
	
	//Check_Minor NC(Nc meaing no creation) should be similar. However modifications have meant these two have evolved in different directions) the NC version has 520 calls to it compared to 72 to Check_Minor
	//this has been the starting point for re-organisation
	//$1 was a pointer to the variable or field name being entered(same as the non NC version. This was used also to work out the position of the object-using an object name will be better(the field could be on the form more than once!)
	//this could be set to include the word -in selection to get the search to happen within the current selection(there are other ways to achieve that with the object model
	//$2 Was the name of the variable in which the corresponding 'name' would be displayed, minus the v for variable!. THis is the same as the non NC version)-just without the name being used in any message. 
	//note that this did not have the alternative version avaible in the non NC version hence why the parameters get out of step after $6
	//$3 was a pointer to the table used in the construction of a usage code if $7 was greater than zero-this is the same the meaning of the 8 paramters on the non NC except that the non NC was using the existence of an 8th paremeter and the number of that 8th parameter. wherease the NC version which was expecting more than 7 parameters only used the value if greater than 0
	//$3 if $7<=0 is the table to query-same as the non NC
	//there is an extra but in NC when the table is JOB types which uses parameters 9 on which was used to create different classes of job types.
	//my memory was that this was because the way job types was impement was problematic at workstation where JOB TYPES could both refer to the AGENCY manager where you are trying to fulfil a JOB TYPE, or could refer to JOB within COSTING-so the very different project management JOB COSTING solution. 
	//this was clever and should be retained-even though we dont have this.
	//$4 is the field to query(same as the non NC
	//$5 was an alternactive field to query-same as non NC
	//$6 was same as non NC a method to execute of a form name to use-but this part has a false wrapper
	///$7 was the number of the related code usage table. this equivant to $8 in the non NC method
	//$8(optional) was to say whether this was to do an initial search....why. well there was a concept of a pipeline and in there you might have some projects or jobs. you have quried for the jobs for a company and you want to search within that selection-so you dont want to search be for example project code EXCEPT within the range for the company-i think there are better ways to do this-and this was my code
	//the above as far as i can see was only used with Projects jobs and orders within the sales pipeline-that needs resurecting quickly
	//$9,10 is passed were the objec positions-if not passed 
	
	///Now with this method was pass things differently
	//$1 is an object
	//this can contain the following attributes
	//objectname this is the object name of the object the user has just entered data in. this is used to get the variable and get the data entered.
	//objectvalue where this is not used for a screen object?
	
	//SearchTable this is the table name to search on.
	////SearchFields this is a COLLECTION(one or more) of field names on that table to look-potentially more flexible
	//ResultNameObject is the name of the variable to put the NAME in 
	//WindowValues this is optional-where to Open_Any_Window
	//NoSearch (boolean) to tell the query not do do an initial query
	//EnableCreation to tell the query to allow record creation(so same as using the non NC version
	//Title the equivelant of passing $7-in fact this would also be the equivlant of what was in $2 except that it is not the same as the way $2 was used-we don't expect the object to be named this way.
	//CodeUse is the table name of of a table to use as code use where in the NC version this was a number
	
	
	//------------------ Revision Control ----------------
	//Date Created:  08/05/2021
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_QueryCurrentSelection; $_bo_TypeSet; $_bo_useNewentitySelection)
	C_COLLECTION:C1488($_Col_FieldNames; $_col_SearchFields; $_col_window)
	C_LONGINT:C283($_l_Bottom; $_l_CodeUse; $_l_Left; $_l_OBottom; $_l_OLeft; $_l_ORight; $_l_OTop; $_l_Right; $_l_ScreenCentre; $_l_ScreenVCentre; $_l_TableIndex)
	C_LONGINT:C283($_l_Top; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop)
	C_OBJECT:C1216($_obj_; $_obj_CodeUses; $_obj_CURecords; $_Obj_CurrentSelection; $_obj_DataStore; $_obj_Entity; $_obj_EntitySelection; $_obj_EntitySelectionNew; $_obj_MinorToCheck; $1)
	C_POINTER:C301($_Ptr_ResultVar; $_Ptr_SearchVar; $_ptr_Table)
	C_TEXT:C284($_t_Code; $_t_DSName; $_t_LastChar; $_t_NulVar; $_t_ObjectName; $_t_QueryValues; $_t_ResultNameObject; $_t_SeachTable; $_t_SearchText; $_t_SearchValue)
End if 
//Code Starts Here
If (Count parameters:C259>=1)
	$_obj_MinorToCheck:=$1
	$_t_ObjectName:=""
	$_t_SearchValue:=""
	$_col_window:=New collection:C1472
	If (Not:C34($_obj_MinorToCheck.ObjectName=Null:C1517))
		$_t_ObjectName:=$_obj_MinorToCheck.ObjectName
	End if 
	//If (Not($_obj_MinorToCheck.FieldValue=Null))//we dont need this one
	//$_t_SearchValue:=$_obj_MinorToCheck.FieldValue
	//End if 
	If (Not:C34($_obj_MinorToCheck.SearchTable=Null:C1517))
		$_t_SeachTable:=$_obj_MinorToCheck.SearchTable
	End if 
	If (Not:C34($_obj_MinorToCheck.SearchFields=Null:C1517))
		$_col_SearchFields:=$_obj_MinorToCheck.SearchFields  //this is a colleciton of fields to look in
		
	End if 
	If (Not:C34($_obj_MinorToCheck.ResultNameObject=Null:C1517))
		$_t_ResultNameObject:=$_obj_MinorToCheck.ResultNameObject  //this is a colleciton of fields to look in
		
	End if 
	If (Not:C34($_obj_MinorToCheck.WindowValues=Null:C1517))
		$_col_window:=$_obj_MinorToCheck.WindowValues  //this is a collection either 2 or 4 parameters left top right bottom
		Case of 
			: ($_col_window.length=2)
				$_l_Left:=$_col_window[0]
				$_l_Right:=$_l_Left
				$_l_Top:=$_col_window[1]
				$_l_Bottom:=$_l_Top
				
				
			: ($_col_window.length=4)
				$_l_Left:=$_col_window[0]
				$_l_Right:=$_col_window[1]
				$_l_Top:=$_col_window[2]
				$_l_Bottom:=$_col_window[3]
			Else 
				If ($_t_ObjectName#"")
					OBJECT GET COORDINATES:C663(*; $_t_ObjectName; $_l_Left; $_l_Top; $_l_Right; $_l_Bottom)
				End if 
		End case 
	Else 
		If ($_t_ObjectName#"")
			OBJECT GET COORDINATES:C663(*; $_t_ObjectName; $_l_Left; $_l_Top; $_l_Right; $_l_Bottom)
			$_col_window.push($_l_Left)
			$_col_window.push($_l_Top)
			$_col_window.push($_l_Right)
			$_col_window.push($_l_Bottom)
		End if 
	End if 
End if 
GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
If ($_l_Left=0) & ($_l_Top=0)
	//we don't know where to put the window so put it in the middle
	$_l_ScreenCentre:=($_l_WindowRight-$_l_WindowLeft)/2
	$_l_Left:=$_l_ScreenCentre-(190/2)
	$_l_ScreenVCentre:=($_l_WindowBottom-$_l_windowTop)/2
	$_l_Right:=$_l_Left
	$_l_Top:=$_l_ScreenVCentre-(160/2)
	$_l_Bottom:=$_l_Top
Else 
	$_l_OLeft:=$_l_WindowLeft+$_l_Left
	$_l_OTop:=$_l_windowTop+$_l_Top
	$_l_ORight:=$_l_WindowLeft+$_l_Left
	$_l_OBottom:=($_l_windowTop+$_l_Top)
End if 
If (Not:C34($_obj_MinorToCheck.ObjectName=Null:C1517))  //this is also where the result of the CODE(id) goes
	$_Ptr_SearchVar:=OBJECT Get pointer:C1124(Object named:K67:5; $_obj_MinorToCheck.ObjectName)
Else 
	//but sometimes we do want to pass a value that is not on screen
	If (Not:C34($_obj_MinorToCheck.ObjectValue=Null:C1517))
	Else 
		$_Ptr_SearchVar:=->$_t_NulVar
	End if 
End if 
If (Not:C34($_obj_MinorToCheck.ResultNameObject=Null:C1517))  //this optionally is where the result of the name goes.
	$_Ptr_ResultVar:=OBJECT Get pointer:C1124(Object named:K67:5; $_obj_MinorToCheck.ResultNameObject)
	
Else 
	$_Ptr_ResultVar:=->$_t_NulVar
	
End if 
If (Not:C34($_obj_MinorToCheck.CodeUse=Null:C1517))  //this is the table to query
	//code use is a system of subdividing records in these tables into groups
	$_l_CodeUse:=$_obj_MinorToCheck.CodeUse
Else 
	$_l_CodeUse:=-1
End if 
//note that to NOT use code use you have to pass a zero in code use. in the old code code use was the 7th parameter

If (Not:C34($_obj_MinorToCheck.SearchTable=Null:C1517))  //this is the table to query
	$_t_DSName:=$_obj_MinorToCheck.SearchTable
	$_l_TableIndex:=DB_GetTableNumFromNameString($_obj_MinorToCheck.SearchTable)  //this already existing method is used to extract the table number. Whilst in ORDA we don't use table number
	
	If (Not:C34($_obj_MinorToCheck.SearchFields=Null:C1517))  //this  is the fields to query
		$_Col_FieldNames:=$_obj_MinorToCheck.SearchFields
		If ($_Ptr_SearchVar->="in-selection@")  //i dont think we need to do this this way here-we can pass this an an attribute of
			$_Ptr_SearchVar->:=Substring:C12($_Ptr_SearchVar->; 13)
			If ($_l_TableIndex>0)
				$_ptr_Table:=Table:C252($_l_TableIndex)
				$_bo_QueryCurrentSelection:=True:C214
				$_Obj_CurrentSelection:=Create entity selection:C1512($_ptr_Table->)
			End if 
		End if 
		$_Ptr_SearchVar->:=Check_QM($_Ptr_SearchVar->)
		$_t_LastChar:=Substring:C12($_Ptr_SearchVar->; Length:C16($_Ptr_SearchVar->); 1)
		
		If ($_l_TableIndex>0) & ($_l_CodeUse>0)  //code use query
			If ($_l_TableIndex<1000)
				$_t_Code:=String:C10($_l_TableIndex)
				$_t_Code:=("0"*(3-Length:C16($_t_Code)))+$_t_Code+$_t_SearchText
			Else 
				$_t_Code:=String:C10($_l_TableIndex)
				$_t_Code:=("0"*(4-Length:C16($_t_Code)))+$_t_Code+$_t_SearchText
			End if 
			$_obj_CodeUses:=ds:C1482.CODE_USES.query("Code =:1 and Use =:2"; $_t_Code; $_l_CodeUse)
			If (($_obj_CodeUses.length=0) & (Character code:C91($_t_LastChar)#64))
				$_t_Code:=$_t_Code+"@"
				$_obj_CodeUses:=ds:C1482.CODE_USES.query("Code =:1 and Use =:2"; $_t_Code; $_l_CodeUse)
			End if 
			If ($_obj_CodeUses.length=0)
				If (Character code:C91($_t_LastChar)#64)
					$_t_Code:=$_Ptr_SearchVar->+"@"
				Else 
					$_t_Code:=$_Ptr_SearchVar->
				End if 
				//$_obj_EntitySelection:=ds.$_t_DSName.query(
				$_obj_DataStore:=ds:C1482
				$_t_QueryValues:=$_Col_FieldNames[0]+" ="+$_t_Code
				$_obj_EntitySelection:=$_obj_DataStore[$_t_DSName].query($_t_QueryValues)
				If ($_bo_QueryCurrentSelection)
					$_obj_EntitySelection:=$_obj_EntitySelection.and($_Obj_CurrentSelection)
				End if 
				C_OBJECT:C1216($_obj_CURecords)
				If ($_obj_EntitySelection.length>0)
					//so we need to pass this the DSName(the table name), DSattribute(the field name), and the collection of records in the table.
					$_obj_CURecords:=Project_CodeUseSelection(New object:C1471("fromDSNAME"; $_t_DSName; "fromDsAttribute"; $_col_SearchFields[0]; "FromCollection"; $_obj_EntitySelection))
				End if 
				If ($_obj_CURecords.length>0)
					//$_obj_EntitySelection:=Join_CodeUseSelection (New object("toDSNAME";$_t_DSName;"toDsAttribute";$_col_SearchFields[0];"FromCUCollection";$_obj_CURecords))
				End if 
				If ($_t_DSName="JOB_TYPES")
					If (Not:C34($_obj_MinorToCheck.JobClass=Null:C1517))
						$_bo_useNewentitySelection:=False:C215
						For each ($_obj_Entity; $_obj_EntitySelection)
							$_bo_TypeSet:=$_obj_Entity.TypeClass ?? $_obj_MinorToCheck.JobClass
							If (Not:C34($_obj_Entity.TypeClass=0)) & (Not:C34($_bo_TypeSet))
								$_obj_EntitySelectionNew:=$_obj_EntitySelection.minus($_obj_Entity)
								$_bo_useNewentitySelection:=True:C214
							End if 
						End for each 
						If ($_bo_useNewentitySelection)
							$_obj_EntitySelection:=$_obj_EntitySelectionNew.copy()
						Else 
							//return none
							
						End if 
					End if 
				End if 
				
			End if 
		Else 
			$_obj_DataStore:=ds:C1482
			$_t_QueryValues:=$_Col_FieldNames[0]+" ="+$_Ptr_SearchVar->
			$_obj_EntitySelection:=$_obj_DataStore[$_t_DSName].query($_t_QueryValues)
			
			Case of 
				: ($_obj_MinorToCheck.SearchFields.length=1)  //search one field
					$_obj_EntitySelection:=$_obj_DataStore[$_t_DSName].query($_t_QueryValues)
				: ($_obj_MinorToCheck.SearchFields.length=2)  //search two fields
					$_obj_EntitySelection:=$_obj_DataStore[$_t_DSName].query($_t_QueryValues)
			End case 
		End if 
		
	End if 
End if 

//End if 
