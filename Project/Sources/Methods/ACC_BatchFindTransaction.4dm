//%attributes = {}

If (False:C215)
	//Project Method Name:      ACC_BatchFindTransaction
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
	C_BOOLEAN:C305($_bo_InSelection; $_bo_NoSet1; $_bo_NoSet2; $_bo_NoSet3; $_bo_NoSet4; $_bo_NoSet5; $_bo_NoSet6; $_bo_NoSet7; $_bo_NoSet8; $8)
	C_LONGINT:C283($1)
	C_REAL:C285($_r_Amount; $_r_TaxAmount; $6; $7)
	C_TEXT:C284($_t_AccountCode; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_oldMethodName; $2; $3; $4; $5)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BatchFindTransaction")


If (True:C214)
	If (Count parameters:C259>=8)
		
		$_bo_InSelection:=$8
		CREATE SET:C116([TRANSACTIONS:29]; "CurrentTrans")
	Else 
		$_bo_InSelection:=False:C215
	End if 
	
	
	$_bo_NoSet1:=False:C215
	$_bo_NoSet2:=False:C215
	$_bo_NoSet3:=False:C215
	$_bo_NoSet4:=False:C215
	$_bo_NoSet5:=False:C215
	$_bo_NoSet6:=False:C215
	$_bo_NoSet7:=False:C215
	CREATE EMPTY SET:C140([TRANSACTIONS:29]; "1")
	CREATE EMPTY SET:C140([TRANSACTIONS:29]; "2")
	CREATE EMPTY SET:C140([TRANSACTIONS:29]; "3")
	CREATE EMPTY SET:C140([TRANSACTIONS:29]; "4")
	CREATE EMPTY SET:C140([TRANSACTIONS:29]; "5")
	CREATE EMPTY SET:C140([TRANSACTIONS:29]; "6")
	CREATE EMPTY SET:C140([TRANSACTIONS:29]; "7")
	If ($1>0)
		If ($_bo_InSelection)
			USE SET:C118("CurrentTrans")
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=$1)
		Else 
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=$1)
		End if 
		
		CREATE SET:C116([TRANSACTIONS:29]; "1")
	Else 
		REDUCE SELECTION:C351([TRANSACTIONS:29]; 0)
		//ALL RECORDS([TRANSACTIONS])
		$_bo_NoSet1:=True:C214
		CREATE EMPTY SET:C140([TRANSACTIONS:29]; "1")
	End if 
	If (Count parameters:C259>=2)
		$_t_AccountCode:=$2
	Else 
		$_t_AccountCode:=""
	End if 
	If (Count parameters:C259>=3)
		$_t_AnalysisCode:=$3
	Else 
		$_t_AnalysisCode:=""
	End if 
	If (Count parameters:C259>=4)
		$_t_LayerCode:=$4
	Else 
		$_t_LayerCode:=""
	End if 
	If (Count parameters:C259>=5)
		$_t_CurrencyCode:=$5
	Else 
		$_t_CurrencyCode:=""
	End if 
	If (Count parameters:C259>=6)
		$_r_Amount:=$6
	Else 
		$_r_Amount:=0
	End if 
	If (Count parameters:C259>=7)
		$_r_TaxAmount:=$7
	Else 
		$_r_TaxAmount:=0
	End if 
	If ($_t_AccountCode#"")
		If ($_bo_InSelection)
			USE SET:C118("CurrentTrans")
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=$_t_AccountCode)
		Else 
			
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=$_t_AccountCode)
		End if 
		
		CREATE SET:C116([TRANSACTIONS:29]; "2")
	Else 
		//ALL RECORDS([TRANSACTIONS])
		$_bo_NoSet2:=True:C214
		//CREATE SET([TRANSACTIONS];"2")
		
	End if 
	If ($_t_AnalysisCode#"")
		If ($_bo_InSelection)
			USE SET:C118("CurrentTrans")
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2=$_t_AnalysisCode)
		Else 
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2=$_t_AnalysisCode)
		End if 
		
		CREATE SET:C116([TRANSACTIONS:29]; "3")
	Else 
		$_bo_NoSet3:=True:C214
		//ALL RECORDS([TRANSACTIONS])
		//CREATE SET([TRANSACTIONS];"3")
	End if 
	If ($_t_LayerCode#"")
		If ($_bo_InSelection)
			USE SET:C118("CurrentTrans")
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23=$_t_LayerCode)
		Else 
			
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23=$_t_LayerCode)
		End if 
		
		CREATE SET:C116([TRANSACTIONS:29]; "4")
	Else 
		//ALL RECORDS([TRANSACTIONS])
		//CREATE SET([TRANSACTIONS];"4")
		$_bo_NoSet4:=True:C214
	End if 
	If ($_t_CurrencyCode#"")
		If ($_bo_InSelection)
			USE SET:C118("CurrentTrans")
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode)
		Else 
			
			
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode)
		End if 
		
		CREATE SET:C116([TRANSACTIONS:29]; "5")
	Else 
		//ALL RECORDS([TRANSACTIONS])
		//CREATE SET([TRANSACTIONS];"5")
		$_bo_NoSet5:=True:C214
	End if 
	
	If ($_r_Amount#0)
		If ($_bo_InSelection)
			USE SET:C118("CurrentTrans")
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Amount:6=$_r_Amount)
		Else 
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Amount:6=$_r_Amount)
		End if 
		
		CREATE SET:C116([TRANSACTIONS:29]; "6")
	Else 
		//ALL RECORDS([TRANSACTIONS])
		//CREATE SET([TRANSACTIONS];"6")
		$_bo_NoSet6:=True:C214
	End if 
	If ($_r_TaxAmount#0)
		If ($_bo_InSelection)
			USE SET:C118("CurrentTrans")
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Amount:16=$_r_TaxAmount)
		Else 
			
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Amount:16=$_r_TaxAmount)
		End if 
		
		CREATE SET:C116([TRANSACTIONS:29]; "7")
	Else 
		//ALL RECORDS([TRANSACTIONS])
		//CREATE SET([TRANSACTIONS];"7")
		$_bo_NoSet7:=True:C214
	End if 
	//we now have seven set
	
	CREATE EMPTY SET:C140([TRANSACTIONS:29]; "8")
	$_bo_NoSet8:=True:C214
	If ($_bo_NoSet1=False:C215) & ($_bo_NoSet2=False:C215)
		INTERSECTION:C121("1"; "2"; "8")
		$_bo_NoSet8:=False:C215
	Else 
		If ($_bo_NoSet1=False:C215)
			UNION:C120("1"; "8"; "8")
			$_bo_NoSet8:=False:C215
		Else 
			If ($_bo_NoSet2=False:C215)
				UNION:C120("2"; "8"; "8")
				$_bo_NoSet8:=False:C215
			End if 
		End if 
	End if 
	If ($_bo_NoSet3=False:C215) & ($_bo_NoSet8=False:C215)
		INTERSECTION:C121("8"; "3"; "8")
		$_bo_NoSet8:=False:C215
	Else 
		If ($_bo_NoSet3=False:C215)
			UNION:C120("3"; "8"; "8")
			$_bo_NoSet8:=False:C215
		End if 
	End if 
	If ($_bo_NoSet4=False:C215) & ($_bo_NoSet8=False:C215)
		INTERSECTION:C121("8"; "4"; "8")
		$_bo_NoSet8:=False:C215
	Else 
		If ($_bo_NoSet4=False:C215)
			UNION:C120("4"; "8"; "8")
			$_bo_NoSet8:=False:C215
		End if 
	End if 
	If ($_bo_NoSet5=False:C215) & ($_bo_NoSet8=False:C215)
		INTERSECTION:C121("8"; "5"; "8")
		$_bo_NoSet8:=False:C215
	Else 
		If ($_bo_NoSet5=False:C215)
			UNION:C120("5"; "8"; "8")
			$_bo_NoSet8:=False:C215
		End if 
	End if 
	If ($_bo_NoSet6=False:C215) & ($_bo_NoSet8=False:C215)
		INTERSECTION:C121("8"; "6"; "8")
		$_bo_NoSet8:=False:C215
	Else 
		If ($_bo_NoSet6=False:C215)
			UNION:C120("6"; "8"; "8")
			$_bo_NoSet8:=False:C215
		End if 
	End if 
	If ($_bo_NoSet7=False:C215) & ($_bo_NoSet8=False:C215)
		INTERSECTION:C121("8"; "7"; "8")
	Else 
		If ($_bo_NoSet7=False:C215)
			UNION:C120("7"; "8"; "8")
			$_bo_NoSet8:=False:C215
		End if 
	End if 
	
	
	USE SET:C118("8")
	If (Records in selection:C76([TRANSACTIONS:29])=0)
		CREATE EMPTY SET:C140([TRANSACTIONS:29]; "8")
		$_bo_NoSet8:=True:C214
		If ($_bo_NoSet1=False:C215) & ($_bo_NoSet1=False:C215)
			INTERSECTION:C121("1"; "2"; "8")
		Else 
			If ($_bo_NoSet1=False:C215)
				UNION:C120("1"; "8"; "8")
			Else 
				If ($_bo_NoSet2=False:C215)
					UNION:C120("2"; "8"; "8")
				End if 
			End if 
		End if 
		USE SET:C118("8")
		If (Records in selection:C76([TRANSACTIONS:29])=0)
			//NOTHING MATCHED ACCOUNT CODE
			//SO INTERSECT ANALYSIS WITH BATCH
			If ($_bo_NoSet3=False:C215)
				INTERSECTION:C121("1"; "3"; "8")
			End if 
			
		Else 
			//SOMETHING MATCHED ACCOUNT
			If ($_bo_NoSet3=False:C215)
				INTERSECTION:C121("8"; "3"; "8")
			End if 
			USE SET:C118("8")
			If (Records in selection:C76([TRANSACTIONS:29])=0)
				//NOTHING FOR THIS ACCOUNT WITH THIS ANALYSES
				//SO RE-INTERSECT ACCOUNT FOR BATCH
				INTERSECTION:C121("1"; "2"; "8")
				USE SET:C118("8")
			End if 
		End if 
		
		USE SET:C118("8")
		If (Records in selection:C76([TRANSACTIONS:29])=0)
			//NOTHING MATCHED ANALYSES  /ACCOUNT
			//TEST THE LAYER
			INTERSECTION:C121("1"; "4"; "8")
		Else 
			//SOMETHING MATCHED ANALYSES/ACCOUNT
			INTERSECTION:C121("1"; "4"; "9")
			//TEST INTERSECTING THE MATCH SO FAR
			//WITH THE LAYER
			USE SET:C118("9")
			If (Records in selection:C76([TRANSACTIONS:29])=0)
				USE SET:C118("8")
			Else 
				CREATE SET:C116([TRANSACTIONS:29]; "8")
				
			End if 
			CLEAR SET:C117("9")
			
		End if 
		
		USE SET:C118("8")
		If (Records in selection:C76([TRANSACTIONS:29])=0)
			//NOTHING MATCHED
			INTERSECTION:C121("1"; "5"; "8")
		Else 
			INTERSECTION:C121("8"; "5"; "9")
			USE SET:C118("9")
			If (Records in selection:C76([TRANSACTIONS:29])=0)
				USE SET:C118("8")
			Else 
				CREATE SET:C116([TRANSACTIONS:29]; "8")
				
			End if 
			CLEAR SET:C117("9")
		End if 
		
		USE SET:C118("8")
		If (Records in selection:C76([TRANSACTIONS:29])=0)
			//NOTHING MATCHED
			INTERSECTION:C121("1"; "6"; "8")
		Else 
			INTERSECTION:C121("8"; "6"; "9")
			USE SET:C118("9")
			If (Records in selection:C76([TRANSACTIONS:29])=0)
				USE SET:C118("8")
			Else 
				CREATE SET:C116([TRANSACTIONS:29]; "8")
				
			End if 
			CLEAR SET:C117("9")
		End if 
	End if 
	USE SET:C118("8")
	
	
	
	
	
	CLEAR SET:C117("1")
	CLEAR SET:C117("2")
	CLEAR SET:C117("3")
	CLEAR SET:C117("4")
	CLEAR SET:C117("5")
	CLEAR SET:C117("6")
	CLEAR SET:C117("7")
	CLEAR SET:C117("8")
	
Else 
	$_t_oldMethodName:=ERR_MethodTracker("ACC_BatchFindTransaction")
	If (Count parameters:C259>=8)
		
		$_bo_InSelection:=$8
		CREATE SET:C116([TRANSACTIONS:29]; "CurrentTrans")
	Else 
		$_bo_InSelection:=False:C215
	End if 
	
	
	
	If ($1>0)
		If ($_bo_InSelection)
			USE SET:C118("CurrentTrans")
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=$1)
		Else 
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=$1)
		End if 
		
		CREATE SET:C116([TRANSACTIONS:29]; "1")
	Else 
		ALL RECORDS:C47([TRANSACTIONS:29])
		CREATE SET:C116([TRANSACTIONS:29]; "1")
	End if 
	If (Count parameters:C259>=2)
		$_t_AccountCode:=$2
	Else 
		$_t_AccountCode:=""
	End if 
	If (Count parameters:C259>=3)
		$_t_AnalysisCode:=$3
	Else 
		$_t_AnalysisCode:=""
	End if 
	If (Count parameters:C259>=4)
		$_t_LayerCode:=$4
	Else 
		$_t_LayerCode:=""
	End if 
	If (Count parameters:C259>=5)
		$_t_CurrencyCode:=$5
	Else 
		$_t_CurrencyCode:=""
	End if 
	If (Count parameters:C259>=6)
		$_r_Amount:=$6
	Else 
		$_r_Amount:=0
	End if 
	If (Count parameters:C259>=7)
		$_r_TaxAmount:=$7
	Else 
		$_r_TaxAmount:=0
	End if 
	If ($_t_AccountCode#"")
		If ($_bo_InSelection)
			USE SET:C118("CurrentTrans")
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=$_t_AccountCode)
		Else 
			
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=$_t_AccountCode)
		End if 
		
		CREATE SET:C116([TRANSACTIONS:29]; "2")
	Else 
		ALL RECORDS:C47([TRANSACTIONS:29])
		
		CREATE SET:C116([TRANSACTIONS:29]; "2")
		
	End if 
	If ($_t_AnalysisCode#"")
		If ($_bo_InSelection)
			USE SET:C118("CurrentTrans")
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2=$_t_AnalysisCode)
		Else 
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2=$_t_AnalysisCode)
		End if 
		
		CREATE SET:C116([TRANSACTIONS:29]; "3")
	Else 
		ALL RECORDS:C47([TRANSACTIONS:29])
		CREATE SET:C116([TRANSACTIONS:29]; "3")
	End if 
	If ($_t_LayerCode#"")
		If ($_bo_InSelection)
			USE SET:C118("CurrentTrans")
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23=$_t_LayerCode)
		Else 
			
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23=$_t_LayerCode)
		End if 
		
		CREATE SET:C116([TRANSACTIONS:29]; "4")
	Else 
		ALL RECORDS:C47([TRANSACTIONS:29])
		CREATE SET:C116([TRANSACTIONS:29]; "4")
	End if 
	If ($_t_CurrencyCode#"")
		If ($_bo_InSelection)
			USE SET:C118("CurrentTrans")
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode)
		Else 
			
			
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_t_CurrencyCode)
		End if 
		
		CREATE SET:C116([TRANSACTIONS:29]; "5")
	Else 
		ALL RECORDS:C47([TRANSACTIONS:29])
		CREATE SET:C116([TRANSACTIONS:29]; "5")
	End if 
	
	If ($_r_Amount#0)
		If ($_bo_InSelection)
			USE SET:C118("CurrentTrans")
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Amount:6=$_r_Amount)
		Else 
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Amount:6=$_r_Amount)
		End if 
		
		CREATE SET:C116([TRANSACTIONS:29]; "6")
	Else 
		ALL RECORDS:C47([TRANSACTIONS:29])
		CREATE SET:C116([TRANSACTIONS:29]; "6")
	End if 
	If ($_r_TaxAmount#0)
		If ($_bo_InSelection)
			USE SET:C118("CurrentTrans")
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Amount:16=$_r_TaxAmount)
		Else 
			
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Amount:16=$_r_TaxAmount)
		End if 
		
		CREATE SET:C116([TRANSACTIONS:29]; "7")
	Else 
		ALL RECORDS:C47([TRANSACTIONS:29])
		CREATE SET:C116([TRANSACTIONS:29]; "7")
	End if 
	//we now have seven set
	
	
	INTERSECTION:C121("1"; "2"; "8")
	INTERSECTION:C121("8"; "3"; "8")
	INTERSECTION:C121("8"; "4"; "8")
	INTERSECTION:C121("8"; "5"; "8")
	INTERSECTION:C121("8"; "6"; "8")
	INTERSECTION:C121("8"; "7"; "8")
	
	
	USE SET:C118("8")
	If (Records in selection:C76([TRANSACTIONS:29])=0)
		INTERSECTION:C121("1"; "2"; "8")
		USE SET:C118("8")
		If (Records in selection:C76([TRANSACTIONS:29])=0)
			//NOTHING MATCHED ACCOUNT CODE
			//SO INTERSECT ANALYSIS WITH BATCH
			INTERSECTION:C121("1"; "3"; "8")
		Else 
			//SOMETHING MATCHED ACCOUNT
			INTERSECTION:C121("8"; "3"; "8")
			USE SET:C118("8")
			If (Records in selection:C76([TRANSACTIONS:29])=0)
				//NOTHING FOR THIS ACCOUNT WITH THIS ANALYSES
				//SO RE-INTERSECT ACCOUNT FOR BATCH
				INTERSECTION:C121("1"; "2"; "8")
				USE SET:C118("8")
			End if 
		End if 
		
		USE SET:C118("8")
		If (Records in selection:C76([TRANSACTIONS:29])=0)
			//NOTHING MATCHED ANALYSES  /ACCOUNT
			//TEST THE LAYER
			INTERSECTION:C121("1"; "4"; "8")
		Else 
			//SOMETHING MATCHED ANALYSES/ACCOUNT
			INTERSECTION:C121("1"; "4"; "9")
			//TEST INTERSECTING THE MATCH SO FAR
			//WITH THE LAYER
			USE SET:C118("9")
			If (Records in selection:C76([TRANSACTIONS:29])=0)
				USE SET:C118("8")
			Else 
				CREATE SET:C116([TRANSACTIONS:29]; "8")
				
			End if 
			CLEAR SET:C117("9")
			
		End if 
		
		USE SET:C118("8")
		If (Records in selection:C76([TRANSACTIONS:29])=0)
			//NOTHING MATCHED
			INTERSECTION:C121("1"; "5"; "8")
		Else 
			INTERSECTION:C121("8"; "5"; "9")
			USE SET:C118("9")
			If (Records in selection:C76([TRANSACTIONS:29])=0)
				USE SET:C118("8")
			Else 
				CREATE SET:C116([TRANSACTIONS:29]; "8")
				
			End if 
			CLEAR SET:C117("9")
		End if 
		
		USE SET:C118("8")
		If (Records in selection:C76([TRANSACTIONS:29])=0)
			//NOTHING MATCHED
			INTERSECTION:C121("1"; "6"; "8")
		Else 
			INTERSECTION:C121("8"; "6"; "9")
			USE SET:C118("9")
			If (Records in selection:C76([TRANSACTIONS:29])=0)
				USE SET:C118("8")
			Else 
				CREATE SET:C116([TRANSACTIONS:29]; "8")
				
			End if 
			CLEAR SET:C117("9")
		End if 
	End if 
	USE SET:C118("8")
	
	
	
	
	
	CLEAR SET:C117("1")
	CLEAR SET:C117("2")
	CLEAR SET:C117("3")
	CLEAR SET:C117("4")
	CLEAR SET:C117("5")
	CLEAR SET:C117("6")
	CLEAR SET:C117("7")
	CLEAR SET:C117("8")
	
	
	
	
	
End if 
ERR_MethodTrackerReturn("ACC_BatchFindTransaction"; $_t_oldMethodName)
