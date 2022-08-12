//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders PPEnd
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
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283(vAB)
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders PPEnd")

DB_t_CurrentFormUsage:=""
DB_t_CurrentFormUsage2:=""
Orders_InLPOI(vAB)
FORM SET OUTPUT:C54([ORDERS:24]; "Orders Out")
vTot:=1
Orders_InLPDCo
DB_bo_RecordModified:=True:C214
Order_Title
Orders_InLPBDA
ERR_MethodTrackerReturn("Orders PPEnd"; $_t_oldMethodName)