//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_SetAny3
	//------------------ Method Notes ------------------
	//range of values passed to $1
	//From Sel_CrossTable(where it is $5)
	//(a lot of calls to Sel_CrossTable)
	//[order items]ditems_sel(Form Method) OIBIG
	//[Job Stages]dJobStages_Sel (Form Method and JOB_at_PerSearchTab) PuBig
	//[Job Personnel]dJobPers_Sel(Form Method and JOB_at_PerSearchTab) PuBig<-Same as Job Stage and Movements
	
	
	
	//Attend SelLP ABig<-same as product and project
	//Calls_SelLP Big3
	//Comp_SelLP CBig
	//Cont_SelLP OBig
	//Contracts_SelLP JBig<-same as invoice, jobs
	//Diary_SelLP DBIg
	//Invoices_SelLP JBig
	//Jobs_SelLP JBig
	//Movements_SelLP PuBig<-Same as job stage
	//OrderI_SelLP OIBig
	//Orders_SelLP OrBig
	//Personnel_SelLP(No 5th parameter)?
	//Prod_SelLP Abug<--Same as attendee and project?
	//Projects_SelLP ABig<Same as product and attendee
	//Purchases_SelLP PuBig same as Job Stage
	//PurchOrd_SelLP PuBig same as Job Stage
	//Stock_SelLP TBig same as accounts, current stock, stock level
	//StockCurr_SelLLP TBig same as stock and accounts and stock levels
	//StockLev_SelLP TBig same as stock, accounts
	//Trans_SelLP TBig same as stock, account
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 20:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vSIS)
	C_LONGINT:C283(vButt; vNo)
	C_POINTER:C301($2; $3)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_SetAny3")


If (Count parameters:C259>=3)
	CREATE EMPTY SET:C140($3->; "Big One")
Else 
	CREATE EMPTY SET:C140("Big One")
End if 
//Big one has to exist so when an error comes it is $1
UNION:C120("Big One"; $1; "Big One")
If (Count parameters:C259>=3)
	vNo:=Records in selection:C76($3->)
Else 
	vNo:=Records in selection:C76
End if 

vButt:=$2->
vSIS:=False:C215
CLEAR SET:C117($1)
ERR_MethodTrackerReturn("Sel_SetAny3"; $_t_oldMethodName)
