//%attributes = {}

If (False:C215)
	//Project Method Name:      SQL_LoadDataToObject
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  19/05/2021
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_DataArray; 0; 0)
	ARRAY LONGINT:C221($_al_DataTypes; 0)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY LONGINT:C221($_al_Types; 0)
	ARRAY REAL:C219($_ar_DataArray; 0; 0)
	ARRAY TEXT:C222($_at_ColumNames; 0)
	ARRAY TEXT:C222($_at_Data; 0; 0)
	ARRAY TEXT:C222($_at_DataArray; 0; 0)
	ARRAY TEXT:C222($_at_Properties; 0)
	ARRAY TEXT:C222($_at_Replacements; 0)
	ARRAY TEXT:C222($_at_WhattoReplace; 0)
	C_BOOLEAN:C305($_bo_Executed; $_bo_NoReplace)
	C_COLLECTION:C1488($_COL_ReturnData; $_Col_Row)
	C_LONGINT:C283($_l_Build; $_l_ColumnCount; $_l_Copy; $_l_Copy2; $_l_LoginDelay; $_l_NumberofColumns; $_L_Replace)
	C_OBJECT:C1216($_obj_SqlObject; $_obj_SQLParameters; $1)
	C_POINTER:C301($_Ptr_ReplacementValues; $_Ptr_WhattoReplace)
	C_TEXT:C284($_t_ColumnName; $_t_Execute; $_t_ExecuteParameters; $_t_queryName; $_T_Sql_Return; $_t_SQLDSN; $_t_SQLPW; $_t_SQLSOurce; $_t_SQLStatement; $_t_SQLUSER; $_t_Statement)
End if 
//Code Starts Here



If (True:C214)
	ARRAY LONGINT:C221($_al_DataTypes; 0)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY LONGINT:C221($_al_Types; 0)
	ARRAY REAL:C219($_ar_DataArray; 0; 0)
	ARRAY TEXT:C222($_at_ColumNames; 0)
	ARRAY TEXT:C222($_at_Data; 0; 0)
	ARRAY TEXT:C222($_at_DataArray; 0; 0)
	ARRAY TEXT:C222($_at_Properties; 0)
	ARRAY TEXT:C222($_at_Replacements; 0)
	ARRAY TEXT:C222($_at_WhattoReplace; 0)
	C_BOOLEAN:C305($_bo_Executed; $_bo_NoReplace)
	C_COLLECTION:C1488($_COL_ReturnData; $_Col_Row)
	C_LONGINT:C283($_l_Build; $_l_Copy; $_l_Copy2; $_l_LoginDelay; $_l_NumberofColumns; $_L_Replace)
	C_OBJECT:C1216($_obj_SqlObject; $_obj_SQLParameters; $1)
	C_POINTER:C301($_Ptr_ReplacementValues; $_Ptr_WhattoReplace)
	C_TEXT:C284($_t_ColumnName; $_t_Execute; $_t_ExecuteParameters; $_t_queryName; $_T_Sql_Return; $_t_SQLDSN; $_t_SQLPW; $_t_SQLSOurce; $_t_SQLStatement; $_t_SQLUSER; $_t_Statement)
End if 
//Code Starts Here


If (Count parameters:C259>=1)
	$_obj_SqlObject:=$1
	$_t_queryName:=$_obj_SqlObject.queryname
	$_obj_SQLParameters:=$_obj_SqlObject.Replacements
	
	ARRAY TEXT:C222($_at_Replacements; 0)
	ARRAY TEXT:C222($_at_WhattoReplace; 0)
	//note that $ABA_at_SQL_Result is returning the data in Text arrays.
	OB GET PROPERTY NAMES:C1232($_obj_SqlParameters; $_at_Properties; $_al_Types)
	If (Find in array:C230($_at_Properties; "ReplaceWhat")>0) & (Find in array:C230($_at_Properties; "ReplaceWith")>0)
		OB GET ARRAY:C1229($_obj_SqlParameters; "ReplaceWith"; $_at_Replacements)
		OB GET ARRAY:C1229($_obj_SqlParameters; "ReplaceWhat"; $_at_WhattoReplace)
		$_Ptr_ReplacementValues:=->$_at_Replacements
	Else 
		$_Ptr_ReplacementValues:=->$_at_Replacements
		$_bo_NoReplace:=True:C214
	End if 
	
	
	$_l_NumberofColumns:=0
	$_t_SQLDSN:=""
	$_t_SQLUSER:=""
	$_t_SQLPW:=""
	ARRAY LONGINT:C221($_al_DataTypes; 0)
	//i may replace this with passing the object and just adding the data to the object in there--for now we will add it on return
	$_t_SQLStatement:=TREND_Sql_Builder($_t_queryName; ->$_l_NumberofColumns; ->$_t_SQLSOurce; ->$_t_SQLDSN; ->$_t_SQLUSER; ->$_t_SQLPW; $_Ptr_ReplacementValues)
	$_obj_SqlObject.Statement:=$_t_SQLStatement
	$_obj_SqlObject.NumberofColumns:=$_l_NumberofColumns
	$_obj_SqlObject.SqlSource:=$_t_SQLSOurce
	$_obj_SqlObject.SqlDSN:=$_t_SQLDSN
	$_obj_SqlObject.SqlUser:=$_t_SQLUSER
	$_obj_SqlObject.SqlPW:=$_t_SQLPW
	
	
	//SQL does not like returning to local arrays
	
	ARRAY TEXT:C222($_at_DataArray; 0; 0)
	ARRAY TEXT:C222($_at_Data; $_obj_SqlObject.NumberofColumns; 0)
	//ARRAY REAL($_ar_Data;$_obj_SqlObject.NumberofColumns;0)
	//should be able to replace the following with a for each
	
	For ($_L_Replace; 1; Size of array:C274($_at_Replacements))
		$_at_Replacements{$_L_Replace}:=Replace string:C233($_at_Replacements{$_L_Replace}; Char:C90(10); "")
		$_at_Replacements{$_L_Replace}:=Replace string:C233($_at_Replacements{$_L_Replace}; Char:C90(13); "")
		$_at_Replacements{$_L_Replace}:=Replace string:C233($_at_Replacements{$_L_Replace}; Char:C90(9); "")
		
		
		$_obj_SqlObject.Statement:=Replace string:C233($_obj_SqlObject.Statement; $_at_WhattoReplace{$_L_Replace}; $_at_Replacements{$_L_Replace})
	End for 
	$_T_Sql_Return:=""
	//SQL_t_Statement:=$_obj_SqlObject.Statement
	
	$_l_LoginDelay:=0
	Repeat 
		While (Semaphore:C143("ODBCINUSE"))
			IDLE:C311
			UTIL_DelayTicks((2+$_l_LoginDelay)*60)
			$_l_LoginDelay:=$_l_LoginDelay+1
			If ($_l_LoginDelay>(30))  //it the delay has goto to 30 seconds
				$_l_LoginDelay:=1
			End if 
		End while 
		SQL SET OPTION:C818(SQL connection timeout:K49:8; 12)
		SQL SET OPTION:C818(SQL query timeout:K49:7; 12)
		$_bo_Executed:=False:C215
		
		//ON ERR CALL("SQL_ConnectionErrorHandler")
		Repeat 
			SQL LOGIN:C817($_t_SQLDSN; $_t_SQLUSER; $_t_SQLPW)
			
			If (OK=0)
				
				DELAY PROCESS:C323(Current process:C322; 60*60*5)
			Else 
			End if 
		Until (OK=1)
		//note that SQL does not like returning to pointers to arrays
		ARRAY TEXT:C222($_at_ColumNames; 0)
		SQL_GetColumnNames($_obj_SqlObject.Statement; ->$_at_ColumNames)
		$_l_ColumnCount:=Size of array:C274($_at_ColumNames)
		SQL SET OPTION:C818(SQL query timeout:K49:7; 12)
		If (Not:C34($_obj_SqlObject.NumberofColumns=Null:C1517))
			ARRAY TEXT:C222($_at_DataArray; $_obj_SqlObject.NumberofColumns; 0)
			ARRAY DATE:C224($_ad_DataArray; $_obj_SqlObject.NumberofColumns; 0)
		Else 
			ARRAY TEXT:C222($_at_DataArray; $_l_ColumnCount; 0)
			ARRAY DATE:C224($_ad_DataArray; $_l_ColumnCount; 0)
			
		End if 
		$_t_ExecuteParameters:=""
		Case of 
			: ($_obj_SqlObject.Statement="GetSalesByRSM")
				//here we were unable to get the value to text correct
				//handle any execption  stuff here
				ARRAY REAL:C219($_ar_DataArray; $_obj_SqlObject.NumberofColumns; 0)
				$_t_ExecuteParameters:=$_t_ExecuteParameters+" ;"+"$_at_DataArray{1}"+";"+"$_ar_DataArray{2})"
				$_t_Statement:=$_obj_SqlObject.Statement
				$_t_Execute:="SQL EXECUTE("+Char:C90(34)+"$_t_Statement"+Char:C90(34)+$_t_ExecuteParameters
			Else 
				For ($_l_Build; 1; $_obj_SqlObject.NumberofColumns)
					$_t_ExecuteParameters:=$_t_ExecuteParameters+";"+"$_at_DataArray{"+String:C10($_l_Build)+"}"
				End for 
				$_t_ExecuteParameters:=$_t_ExecuteParameters+")"
				$_t_Statement:=$_obj_SqlObject.Statement
				$_t_Execute:="SQL EXECUTE($_t_Statement"+$_t_ExecuteParameters
				
		End case 
		If ($_t_Execute#"")
			EXECUTE FORMULA:C63($_t_Execute)
			$_bo_Executed:=(OK=1)
			If ($_bo_Executed=False:C215)
				$_obj_SqlObject.error:="SQL Execute Timed out("+$_obj_SqlObject.Statement+")"+Char:C90(13)+Char:C90(13)
				
			Else 
				SQL LOAD RECORD:C822(SQL all records:K49:10)
			End if 
			SQL LOGOUT:C872
			ON ERR CALL:C155("")
			CLEAR SEMAPHORE:C144("ODBCINUSE")
			//Until ($_bo_Executed)  //if the connection timed out
		End if   //so now we want to build what...collecitons
	Until ($_bo_Executed)  //if the connection timed out
	ARRAY TEXT:C222($_at_ColumNames; 0)
	//SQL_GetColumnNames($_obj_SqlObject.Statement;->$_at_ColumNames)
	
	C_COLLECTION:C1488($_COL_ReturnData; $_Col_Row)
	OB GET PROPERTY NAMES:C1232($_obj_SqlObject; $_at_Properties; $_al_PropertyTypes)
	If (Find in array:C230($_at_Properties; "DataCollection")>0)
		If ($_obj_SqlObject.DataCollection.length>0)
			$_COL_ReturnData:=$_obj_SqlObject.DataCollection
		Else 
			$_COL_ReturnData:=New collection:C1472
		End if 
	Else 
		$_COL_ReturnData:=New collection:C1472
	End if 
	//$c.map("Percentage";$c.sum()).
	If (Size of array:C274($_ar_DataArray)>0)  //this first bit is just to get the data into the text arrays.
		For ($_l_Copy; 1; Size of array:C274($_ar_DataArray))
			For ($_l_Copy2; 1; Size of array:C274($_ar_DataArray{$_l_Copy}))
				If ($_ar_DataArray{$_l_Copy}{$_l_Copy2}#0)
					If (Size of array:C274($_at_Data{$_l_Copy})>=$_l_Copy2)
						$_at_DataArray{$_l_Copy}{$_l_Copy2}:=String:C10($_at_DataArray{$_l_Copy}{$_l_Copy2})
					Else 
						INSERT IN ARRAY:C227($_at_DataArray{$_l_Copy}; Size of array:C274($_at_DataArray{$_l_Copy})+1; $_l_Copy2)
						$_at_DataArray{$_l_Copy}{$_l_Copy2}:=String:C10($_at_DataArray{$_l_Copy}{$_l_Copy2})
					End if 
				End if 
			End for 
		End for 
	End if 
	For ($_l_Copy; 1; Size of array:C274($_at_DataArray))
		If (Size of array:C274($_at_DataArray{$_l_Copy})>0)  //i changed my mind here. I was going to put them in an object when there is just one element.
			//but doing that makes all the rest of the code need to assess the type of the attribute.
			$_Col_Row:=New collection:C1472
			ARRAY TO COLLECTION:C1563($_Col_Row; $_at_DataArray{$_l_Copy})
			$_Col_Row:=$_Col_Row.map("UTIL_trimCollection"; "B"; " ")
			//$_Col_Row.map ( methodName {; param}{; param2 ; ... ; paramN} ) -> Function result 
			$_COL_ReturnData.push($_Col_Row)
			$_t_ColumnName:=$_at_ColumNames{$_l_Copy}
			$_obj_SqlObject[$_t_ColumnName]:=$_Col_Row
		Else 
			$_Col_Row:=New collection:C1472
			ARRAY TO COLLECTION:C1563($_Col_Row; $_at_DataArray{$_l_Copy})
			$_COL_ReturnData.push($_Col_Row)
			$_t_ColumnName:=$_at_ColumNames{$_l_Copy}
			If (Size of array:C274($_at_DataArray{$_l_Copy})>0)
				$_obj_SqlObject[$_t_ColumnName]:=UTIL_TrimSpaces(New object:C1471("text"; $_obj_SqlObject[$_t_ColumnName]; "where"; New collection:C1472("Both"); "chars"; New collection:C1472(" ")))  //G_Trim($_at_DataArray{$_l_Copy}{1};"B";" ")
			Else 
				$_obj_SqlObject[$_t_ColumnName]:=New object:C1471
				
			End if 
		End if 
		
	End for 
	$_obj_SqlObject.DataCollection:=$_COL_ReturnData
End if 


