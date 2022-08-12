//%attributes = {}

If (False:C215)
	//Project Method Name:      ORD_AddProducts
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
	C_LONGINT:C283($_l_AddMode; vAdd; vCM)
	C_TEXT:C284($_t_oldMethodName; PROD_t_FunctionName; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_AddProducts")


//This method is called from the menu in sales orders to add a product..ONE PRODUCT
$_t_oldMethodName:=ERR_MethodTracker("ORD_AddProducts")

Start_Process
PROD_t_FunctionName:="Enter Products from sales orders"
READ WRITE:C146([PRODUCTS:9])
$_l_AddMode:=vAdd
vAdd:=1
vCM:=1

Products_FileI
Open_Pro_Window("Enter Product"; 0; 2; ->[PRODUCTS:9]; WIN_t_CurrentInputForm)  //NG may 2004 added input form
ADD RECORD:C56([PRODUCTS:9]; *)
Close_ProWin(Table name:C256(->[PRODUCTS:9])+"_"+WIN_t_CurrentInputForm)  //NG may 2004 added input form name
vCM:=0
vAdd:=$_l_AddMode
READ ONLY:C145([PRODUCTS:9])
PROD_t_FunctionName:=""
Process_End
ERR_MethodTrackerReturn("ORD_AddProducts"; $_t_oldMethodName)