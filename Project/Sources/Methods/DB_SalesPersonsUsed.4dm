//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SalesPersonsUsed
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  07/01/2011 12:37 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_SalesPersons; 0)
	//ARRAY TEXT(DB_at_SPInitials;0)
	C_BOOLEAN:C305(DB_bo_SPReady)
	C_LONGINT:C283($_l_BlankSalesPerson; $_l_CallBackProcess; $_l_TableNumber; $2)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SalesPersonsUsed")
If (Count parameters:C259>=1)
	$_l_CallBackProcess:=$1
	
	If (Count parameters:C259>=2)
		$_l_TableNumber:=$2
	Else 
		$_l_TableNumber:=Table:C252(->[COMPANIES:2])
	End if 
	Case of 
		: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
			
			READ ONLY:C145([COMPANIES:2])
			
			ALL RECORDS:C47([COMPANIES:2])
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
			
			DISTINCT VALUES:C339([COMPANIES:2]Sales_Person:29; $_at_SalesPersons)
		: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
			READ ONLY:C145([ORDERS:24])
			
			ALL RECORDS:C47([ORDERS:24])
			//QUERY([ORDERS];[ORDERS]=0)
			
			DISTINCT VALUES:C339([ORDERS:24]Person:5; $_at_SalesPersons)
		: ($_l_TableNumber=Table:C252(->[DIARY:12]))
			READ ONLY:C145([DIARY:12])
			
			ALL RECORDS:C47([DIARY:12])
			//QUERY([ORDERS];[ORDERS]=0)
			DISTINCT VALUES:C339([DIARY:12]Person:8; $_at_SalesPersons)
			
	End case 
	$_l_BlankSalesPerson:=Find in array:C230($_at_SalesPersons; "")
	If ($_l_BlankSalesPerson>0)
		DELETE FROM ARRAY:C228($_at_SalesPersons; $_l_BlankSalesPerson)
	End if 
	VARIABLE TO VARIABLE:C635($_l_CallBackProcess; DB_at_SPInitials; $_at_SalesPersons)
	
	SET PROCESS VARIABLE:C370($_l_CallBackProcess; DB_bo_SPReady; True:C214)
	
End if 
ERR_MethodTrackerReturn("DB_SalesPersonsUsed"; $_t_oldMethodName)