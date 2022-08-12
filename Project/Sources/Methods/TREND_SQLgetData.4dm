//%attributes = {}

If (False:C215)
	//Database Method Name:      TREND_SQLgetData
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/09/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DataTypes; 0)
	//ARRAY REAL(SQL_ar_returnArray;0;0)
	ARRAY TEXT:C222($_at_mailName; 0)
	ARRAY TEXT:C222($_at_mailTo; 0)
	//ARRAY TEXT(SQL_at_returnArray;0;0)
	C_BOOLEAN:C305($_bo_Executed; $_bo_UseODBC)
	C_LONGINT:C283($_l_Column; $_l_Copy; $_l_Copy2; $_l_index; $_l_LoginDelay; $_l_NumberofColumns; $_l_Replace; $_l_Row)
	C_POINTER:C301($_Ptr_ReplacementValues; $_Ptr_ReturnArray; $_Ptr_WhattoReplace; $2; $3; $4)
	C_TEXT:C284($_t_MailOutContent; $_t_MailType; $_t_oldMethodName; $_T_Sql_Return; $_t_SQLDSN; $_t_SQLPW; $_t_SQLROUTINE; $_t_SQLSOurce; $_t_SQLStatement; $_t_SQLUSER; $1)
	C_TEXT:C284($5; SQL_t_Statement)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("TREND_SQLgetData")


If (Count parameters:C259>=4)
	$_t_SQLROUTINE:=$1
	$_Ptr_ReturnArray:=$4
	$_Ptr_ReplacementValues:=$2
	$_Ptr_WhattoReplace:=$3
	If (Count parameters:C259>=5)
		$_bo_UseODBC:=($5="ODBC")
	Else 
		$_bo_UseODBC:=False:C215
	End if 
	$_l_NumberofColumns:=0
	$_t_SQLDSN:=""
	$_t_SQLUSER:=""
	$_t_SQLPW:=""
	ARRAY LONGINT:C221($_al_DataTypes; 0)
	//The following method is where the SQL statement is created-put any new routines in there and give them a name. the user name and password are also set for the service your sql is to work with 
	
	$_t_SQLStatement:=TREND_Sql_Builder($_t_SQLROUTINE; ->$_l_NumberofColumns; ->$_t_SQLSOurce; ->$_t_SQLDSN; ->$_t_SQLUSER; ->$_t_SQLPW)
	ARRAY TEXT:C222(SQL_at_returnArray; 0; 0)
	ARRAY TEXT:C222($_Ptr_ReturnArray->; 0; 0)
	ARRAY TEXT:C222(SQL_at_returnArray; $_l_NumberofColumns; 0)
	ARRAY REAL:C219(SQL_ar_returnArray; 0; 0)
	
	ARRAY TEXT:C222($_Ptr_ReturnArray->; $_l_NumberofColumns; 0)
	For ($_l_Replace; 1; Size of array:C274($_Ptr_ReplacementValues->))
		$_t_SQLStatement:=Replace string:C233($_t_SQLStatement; $_Ptr_WhattoReplace->{$_l_Replace}; $_Ptr_ReplacementValues->{$_l_Replace})
	End for 
	$_T_Sql_Return:=""
	SQL_t_Statement:=$_t_SQLStatement
	
	If (Not:C34($_bo_UseODBC))
		//Log_CurrentStatus(0;"in SQL_Get Data ("+$1+") -open SQLConnection")
		$_l_LoginDelay:=0
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
		Repeat 
			ON ERR CALL:C155("SQL_ConnectionErrorHandler")
			Repeat 
				SQL LOGIN:C817($_t_SQLDSN; $_t_SQLUSER; $_t_SQLPW)
				
				If (OK=0)
					//Log_CurrentStatus(0;"in SQL_Get Data ("+$1+") -Connection Failed will retry")
					
					DELAY PROCESS:C323(Current process:C322; 60*60*5)
				Else 
					//Log_CurrentStatus(0;"SQL Login Done ("+$1+")")
					
				End if 
			Until (OK=1)
			//note that SQL does not like returning to local arrays-so here we return to Process_Array
			//this bit might look at bit long but that is because an execute immediate is not working with sage
			//so this copes with up to 42 columns..
			//Log_CurrentStatus(0;"SQL Statement is "+$_t_SQLStatement)
			SQL SET OPTION:C818(SQL query timeout:K49:7; 12)
			
			Case of 
				: ($_l_NumberofColumns=43)
					//TRACE
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25}; SQL_at_returnArray{26}; SQL_at_returnArray{27}; SQL_at_returnArray{28}; SQL_at_returnArray{29}; SQL_at_returnArray{30}; SQL_at_returnArray{31}; SQL_at_returnArray{32}; SQL_at_returnArray{33}; SQL_at_returnArray{34}; SQL_at_returnArray{35}; SQL_at_returnArray{36}; SQL_at_returnArray{37}; SQL_at_returnArray{38}; SQL_at_returnArray{39}; SQL_at_returnArray{40}; SQL_at_returnArray{41}; SQL_at_returnArray{42}; SQL_at_returnArray{43})
					$_bo_Executed:=(OK=1)
					
					//TRACE
					
				: ($_l_NumberofColumns=42)
					//TRACE
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25}; SQL_at_returnArray{26}; SQL_at_returnArray{27}; SQL_at_returnArray{28}; SQL_at_returnArray{29}; SQL_at_returnArray{30}; SQL_at_returnArray{31}; SQL_at_returnArray{32}; SQL_at_returnArray{33}; SQL_at_returnArray{34}; SQL_at_returnArray{35}; SQL_at_returnArray{36}; SQL_at_returnArray{37}; SQL_at_returnArray{38}; SQL_at_returnArray{39}; SQL_at_returnArray{40}; SQL_at_returnArray{41}; SQL_at_returnArray{42})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=41)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25}; SQL_at_returnArray{26}; SQL_at_returnArray{27}; SQL_at_returnArray{28}; SQL_at_returnArray{29}; SQL_at_returnArray{30}; SQL_at_returnArray{31}; SQL_at_returnArray{32}; SQL_at_returnArray{33}; SQL_at_returnArray{34}; SQL_at_returnArray{35}; SQL_at_returnArray{36}; SQL_at_returnArray{37}; SQL_at_returnArray{38}; SQL_at_returnArray{39}; SQL_at_returnArray{40}; SQL_at_returnArray{41})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=40)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25}; SQL_at_returnArray{26}; SQL_at_returnArray{27}; SQL_at_returnArray{28}; SQL_at_returnArray{29}; SQL_at_returnArray{30}; SQL_at_returnArray{31}; SQL_at_returnArray{32}; SQL_at_returnArray{33}; SQL_at_returnArray{34}; SQL_at_returnArray{35}; SQL_at_returnArray{36}; SQL_at_returnArray{37}; SQL_at_returnArray{38}; SQL_at_returnArray{39}; SQL_at_returnArray{40})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=39)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25}; SQL_at_returnArray{26}; SQL_at_returnArray{27}; SQL_at_returnArray{28}; SQL_at_returnArray{29}; SQL_at_returnArray{30}; SQL_at_returnArray{31}; SQL_at_returnArray{32}; SQL_at_returnArray{33}; SQL_at_returnArray{34}; SQL_at_returnArray{35}; SQL_at_returnArray{36}; SQL_at_returnArray{37}; SQL_at_returnArray{38}; SQL_at_returnArray{39})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=38)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25}; SQL_at_returnArray{26}; SQL_at_returnArray{27}; SQL_at_returnArray{28}; SQL_at_returnArray{29}; SQL_at_returnArray{30}; SQL_at_returnArray{31}; SQL_at_returnArray{32}; SQL_at_returnArray{33}; SQL_at_returnArray{34}; SQL_at_returnArray{35}; SQL_at_returnArray{36}; SQL_at_returnArray{37}; SQL_at_returnArray{38})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=37)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25}; SQL_at_returnArray{26}; SQL_at_returnArray{27}; SQL_at_returnArray{28}; SQL_at_returnArray{29}; SQL_at_returnArray{30}; SQL_at_returnArray{31}; SQL_at_returnArray{32}; SQL_at_returnArray{33}; SQL_at_returnArray{34}; SQL_at_returnArray{35}; SQL_at_returnArray{36}; SQL_at_returnArray{37})
					$_bo_Executed:=(OK=1)
					
				: ($_l_NumberofColumns=36)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25}; SQL_at_returnArray{26}; SQL_at_returnArray{27}; SQL_at_returnArray{28}; SQL_at_returnArray{29}; SQL_at_returnArray{30}; SQL_at_returnArray{31}; SQL_at_returnArray{32}; SQL_at_returnArray{33}; SQL_at_returnArray{34}; SQL_at_returnArray{35}; SQL_at_returnArray{36})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=35)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25}; SQL_at_returnArray{26}; SQL_at_returnArray{27}; SQL_at_returnArray{28}; SQL_at_returnArray{29}; SQL_at_returnArray{30}; SQL_at_returnArray{31}; SQL_at_returnArray{32}; SQL_at_returnArray{33}; SQL_at_returnArray{34}; SQL_at_returnArray{35})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=34)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25}; SQL_at_returnArray{26}; SQL_at_returnArray{27}; SQL_at_returnArray{28}; SQL_at_returnArray{29}; SQL_at_returnArray{30}; SQL_at_returnArray{31}; SQL_at_returnArray{32}; SQL_at_returnArray{33}; SQL_at_returnArray{34})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=1)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=2)
					$_bo_Executed:=(OK=1)
					If ($_t_SQLROUTINE="GetSalesByRSM")
						ARRAY REAL:C219(SQL_ar_returnArray; $_l_NumberofColumns; 0)
						//ARRAY TEXT(SQL_at_returnArray;$_l_NumberofColumns;0)
						
						SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_ar_returnArray{2})
						$_bo_Executed:=(OK=1)
					Else 
						SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2})
						$_bo_Executed:=(OK=1)
					End if 
					
				: ($_l_NumberofColumns=3)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=33)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25}; SQL_at_returnArray{26}; SQL_at_returnArray{27}; SQL_at_returnArray{28}; SQL_at_returnArray{29}; SQL_at_returnArray{30}; SQL_at_returnArray{31}; SQL_at_returnArray{32}; SQL_at_returnArray{33})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=32)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25}; SQL_at_returnArray{26}; SQL_at_returnArray{27}; SQL_at_returnArray{28}; SQL_at_returnArray{29}; SQL_at_returnArray{30}; SQL_at_returnArray{31}; SQL_at_returnArray{32})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=31)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25}; SQL_at_returnArray{26}; SQL_at_returnArray{27}; SQL_at_returnArray{28}; SQL_at_returnArray{29}; SQL_at_returnArray{30}; SQL_at_returnArray{31})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=30)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25}; SQL_at_returnArray{26}; SQL_at_returnArray{27}; SQL_at_returnArray{28}; SQL_at_returnArray{29}; SQL_at_returnArray{30})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=29)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25}; SQL_at_returnArray{26}; SQL_at_returnArray{27}; SQL_at_returnArray{28}; SQL_at_returnArray{29})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=28)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25}; SQL_at_returnArray{26}; SQL_at_returnArray{27}; SQL_at_returnArray{28})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=27)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25}; SQL_at_returnArray{26}; SQL_at_returnArray{27})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=26)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25}; SQL_at_returnArray{26})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=25)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24}; SQL_at_returnArray{25})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=24)
					
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23}; SQL_at_returnArray{24})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=23)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22}; SQL_at_returnArray{23})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=22)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21}; SQL_at_returnArray{22})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=21)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20}; SQL_at_returnArray{21})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=20)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19}; SQL_at_returnArray{20})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=19)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18}; SQL_at_returnArray{19})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=18)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17}; SQL_at_returnArray{18})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=17)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16}; SQL_at_returnArray{17})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=16)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15}; SQL_at_returnArray{16})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=15)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14}; SQL_at_returnArray{15})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=14)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13}; SQL_at_returnArray{14})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=13)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12}; SQL_at_returnArray{13})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=12)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11}; SQL_at_returnArray{12})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=11)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10}; SQL_at_returnArray{11})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=10)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9}; SQL_at_returnArray{10})
					$_bo_Executed:=(OK=1)
					//;SQL_at_returnArray{10};SQL_at_returnArray{11};SQL_at_returnArray{12};SQL_at_returnArray{13};SQL_at_returnArray{14};SQL_at_returnArray{15};SQL_at_returnArray{16};SQL_at_returnArray{17};SQL_at_returnArray{18};SQL_at_returnArray{19};SQL_at_returnArray{20};SQL_at_returnArray{21})
				: ($_l_NumberofColumns=9)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8}; SQL_at_returnArray{9})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=8)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7}; SQL_at_returnArray{8})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=7)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6}; SQL_at_returnArray{7})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=6)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5}; SQL_at_returnArray{6})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=5)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4}; SQL_at_returnArray{5})
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=4)
					SQL EXECUTE:C820($_t_SQLStatement; SQL_at_returnArray{1}; SQL_at_returnArray{2}; SQL_at_returnArray{3}; SQL_at_returnArray{4})
					$_bo_Executed:=(OK=1)
					
					
					
					
			End case 
			If ($_bo_Executed=False:C215)
				//Log_CurrentStatus(0;"SQL Execute Timed out ("+$1+")")
				//ARRAY TEXT($_at_mailTo;0)
				//ARRAY TEXT($_at_mailName;0)
				//APPEND TO ARRAY($_at_mailTo;"greenleen@trendm.co.uk")
				////APPEND TO ARRAY($_at_mailName;"Nigel Greenlee")
				//$_t_MailType:="To"
				//$_t_MailOutContent:="SQL Execute Timed out ("+$1+")"+Char(13)+Char(13)
				//Email_Send (->$_t_MailType;->$_at_mailName;->$_at_mailTo;"SQL TIMEOUT";->$_t_MailOutContent)
				
			Else 
				//Log_CurrentStatus(0;"SQL about to execute load ("+$1+")")
				
				SQL LOAD RECORD:C822(SQL all records:K49:10)
			End if 
			SQL LOGOUT:C872
			ON ERR CALL:C155("")
			CLEAR SEMAPHORE:C144("ODBCINUSE")
		Until ($_bo_Executed)  //if the connection timed out
		
		//Log_CurrentStatus(0;"in SQL_Get Data ("+$1+") -close SQLConnection")
		///because the data seems to come back with spaces we will strip them off
		
		
	End if 
	If (Size of array:C274(SQL_ar_returnArray)>0)
		
		For ($_l_Copy; 1; Size of array:C274(SQL_ar_returnArray))
			For ($_l_Copy2; 1; Size of array:C274(SQL_ar_returnArray{$_l_Copy}))
				
				If (SQL_ar_returnArray{$_l_Copy}{$_l_Copy2}#0)
					If (Size of array:C274(SQL_at_returnArray{$_l_Copy})>=$_l_Copy2)
						SQL_at_returnArray{$_l_Copy}{$_l_Copy2}:=String:C10(SQL_ar_returnArray{$_l_Copy}{$_l_Copy2})
					Else 
						INSERT IN ARRAY:C227(SQL_at_returnArray{$_l_Copy}; Size of array:C274(SQL_at_returnArray{$_l_Copy})+1; $_l_Copy2)
						SQL_at_returnArray{$_l_Copy}{$_l_Copy2}:=String:C10(SQL_ar_returnArray{$_l_Copy}{$_l_Copy2})
						
					End if 
				End if 
			End for 
		End for 
		
	End if 
	
	
	//Strip off spaces in the values(at the beginning and end)
	If (Size of array:C274(SQL_at_returnArray)>0)
		For ($_l_Row; 1; Size of array:C274(SQL_at_returnArray{1}))
			For ($_l_Column; 1; Size of array:C274(SQL_at_returnArray))
				If (Position:C15(" "; SQL_at_returnArray{$_l_Column}{$_l_Row})>0)
					
					SQL_at_returnArray{$_l_Column}{$_l_Row}:=STR_RemoveLeadTrailSpace(SQL_at_returnArray{$_l_Column}{$_l_Row})
				End if 
				
			End for 
		End for 
	End if 
	//Copy the redundant Process_Array to the local
	For ($_l_index; 1; Size of array:C274(SQL_at_returnArray))
		COPY ARRAY:C226(SQL_at_returnArray{$_l_index}; $_Ptr_ReturnArray->{$_l_index})
	End for 
	ARRAY TEXT:C222(SQL_at_returnArray; 0; 0)
End if 
ERR_MethodTrackerReturn("TREND_SQLgetData"; $_t_oldMethodName)
