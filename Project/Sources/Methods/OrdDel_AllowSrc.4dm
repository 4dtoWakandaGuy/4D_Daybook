//%attributes = {}
If (False:C215)
	//Project Method Name:      OrdDel_AllowSrc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(STK_at_AllocationStockTypes;0)
	C_BOOLEAN:C305(STK_bo_AllocarrayInited)
	C_LONGINT:C283($_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrdDel_AllowSrc")
//OrdDel_AllowSrc
//find Current Stock in selection that are of a Stock Type are incl in Alloc Total
While (Semaphore:C143("$StockTypes"))
	DelayTicks
End while 
//NG May 2008 modifying this to use a Process_Array. Somehow an error was occouring whereby at what was line 21(now line 38 and commented out)
//an array range check error was occouring..how could the array size be anything other than >1 when we arrive here. The array was an interProcess_Array
// i have now changed it to a Process_Array and it can be inited in the current process.
If (STK_bo_AllocarrayInited=False:C215)
	ARRAY TEXT:C222(STK_at_AllocationStockTypes; 0)
	CUT NAMED SELECTION:C334([STOCK_TYPES:59]; "$ST")
	QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Allocated:6=True:C214)
	SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; STK_at_AllocationStockTypes)
	USE NAMED SELECTION:C332("$ST")
	STK_bo_AllocarrayInited:=True:C214
End if 
$_l_SizeofArray:=Size of array:C274(STK_at_AllocationStockTypes)
Case of 
	: ($_l_SizeofArray=0)
		REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
	: ($_l_SizeofArray=1)
		If (Records in selection:C76([CURRENT_STOCK:62])>0)
			QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3=STK_at_AllocationStockTypes{1})
		End if 
		
	Else 
		If (Size of array:C274(STK_at_AllocationStockTypes)>0)
			//NG May 2008 modifying this to use Query with array(faster). Error reported on ws line 21...
			If (Records in selection:C76([CURRENT_STOCK:62])>0)
				CREATE SET:C116([CURRENT_STOCK:62]; "$Set1")
				QUERY WITH ARRAY:C644([CURRENT_STOCK:62]Stock_Type:3; STK_at_AllocationStockTypes)
				If (Records in selection:C76([CURRENT_STOCK:62])>0)
					CREATE SET:C116([CURRENT_STOCK:62]; "$Set2")
					INTERSECTION:C121("$set1"; "$Set2"; "$Set1")
					USE SET:C118("$Set1")
				End if 
				//QUERY SELECTION([CURRENT STOCK];[CURRENT STOCK]Stock Type=STK_at_AllocationStockTypes{1};*)
				//For ($i;2;$_l_SizeofArray)
				//QUERY SELECTION([CURRENT STOCK]; | ;[CURRENT STOCK]Stock Type=STK_at_AllocationStockTypes{$i};*)
				//End for
				//QUERY SELECTION([CURRENT STOCK])
			End if 
		End if 
End case 
CLEAR SEMAPHORE:C144("$StockTypes")
ERR_MethodTrackerReturn("OrdDel_AllowSrc"; $_t_oldMethodName)