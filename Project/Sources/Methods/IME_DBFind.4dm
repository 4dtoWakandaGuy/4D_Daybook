//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_DBFind
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 10:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Draw; $_bo_Query)
	C_LONGINT:C283($_l_RecordsinSelection)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_Auto; $_t_Direct; $_t_ErrorText; $_t_FInd; $_t_FindOptions; $_t_FunctionName; $_t_FunctionTitle; $_t_oldMethodName; $_t_Submit; $1; DB_t_CurrentFormUsage)
	C_TEXT:C284(DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_DBFind")

//IME_DBFind
//Rollo 10/6/2004

//Draw a find page for any table supported in the generic interface


$_t_Direct:=$1  //the page url
$_t_FunctionName:=Substring:C12($_t_Direct; 7; 15)  //eg DBFindCompanies

$_t_FInd:=Substring:C12(IME_FieldValue("find"); 1; 50)  //max imposed by the Comp_Sel etc methods
If ($_t_FInd="")
	$_t_FInd:=Substring:C12(IME_Parameter("find"); 1; 50)  //********  add IME_URL2Text?
End if 

$_t_Auto:=IME_Parameter("auto")  // a url parameter that lets you find from a url, but go straight to DBList

$_t_Submit:=IME_FieldValue("submit")  //the submit button(s) on the form

$_bo_Draw:=True:C214
$_bo_Query:=(($_t_FInd#"") & (($_t_Submit#"") | ($_t_Auto="y@")))

$_t_FunctionTitle:=Uppers3(Lowercase:C14($_t_FunctionName))  //by default use the url name
$_l_RecordsinSelection:=0
$_t_ErrorText:=""
DB_t_CurrentFormUsage:="None"

Case of 
		
	: ($_t_Submit="New")  //clicked the New button
		IME_DBEdit("DBEdit"+$_t_FunctionName)
		$_bo_Query:=False:C215
		$_bo_Draw:=False:C215
		
	: ($_t_FunctionName="Companies@")
		$_ptr_Table:=->[COMPANIES:2]
		$_t_FindOptions:="Company, Postcode, Tel or Surname to find:"  //see Comp_Sel - could be converted to a method to unify them
		If ($_bo_Query)
			Comp_Sel2($_t_FInd+"@")
		End if 
		
	: ($_t_FunctionName="Contacts@")
		$_ptr_Table:=->[CONTACTS:1]
		$_t_FindOptions:="Surname, Forename, Code or Company:"  //see Cont_Sel - could be converted to a method to unify them
		If ($_bo_Query)
			Cont_Sel2($_t_FInd+"@")
		End if 
		
	: ($_t_FunctionName="Products@")
		$_ptr_Table:=->[PRODUCTS:9]
		$_t_FindOptions:="Product Code(s) or Name to find:"  //see Prod_Sel - could be converted to a method to unify them
		If ($_bo_Query)
			Prod_Sel2($_t_FInd+"@")
		End if 
		
	: ($_t_FunctionName="Orders@")
		$_ptr_Table:=->[ORDERS:24]
		$_t_FindOptions:="Company, Contact or Order Code to find:"  //see Orders_Sel - could be converted to a method to unify them
		If ($_bo_Query)
			Orders_Sel($_t_FInd)
		End if 
		
	: ($_t_FunctionName="Diary@")
		$_ptr_Table:=->[DIARY:12]
		$_t_FindOptions:="Company, Date, Person or Document to find:"  //see Diary_Sel - could be converted to a method to unify them
		If ($_bo_Query)
			Diary_Sel($_t_FInd; False:C215)
		End if 
		
		
	: ($_t_FunctionName="ServiceCalls@")
		$_ptr_Table:=->[SERVICE_CALLS:20]
		$_t_FindOptions:="Call Code, Company or Person to find:"  //see Calls_Sel - could be converted to a method to unify them
		$_t_FunctionTitle:="Service Calls"
		If ($_bo_Query)
			Calls_Sel($_t_FInd)
		End if 
		
		//*************************** added the following searches 26/04/07 -kmw **************************
	: ($_t_FunctionName="JobStagePer@")
		$_ptr_Table:=->[JOB PERSONNEL:48]
		$_t_FindOptions:="Job, Stage or Person to find:"  //see JobPers_Sel - could be converted to a method to unify them
		$_t_FunctionTitle:="Job Stage Personnel"
		If ($_bo_Query)
			JobPers_Sel($_t_FInd)
		End if 
	: ($_t_FunctionName="JobStage@")
		$_ptr_Table:=->[JOB_STAGES:47]
		$_t_FindOptions:="Job or Stage to find:"  //see JobStages_Sel - could be converted to a method to unify them
		$_t_FunctionTitle:="Job Stages"
		If ($_bo_Query)
			JobStages_Sel($_t_FInd)
		End if 
	: ($_t_FunctionName="Job@")
		$_ptr_Table:=->[JOBS:26]
		$_t_FindOptions:="Job, Company or Contact to find:"  //see Jobs_Sel - could be converted to a method to unify them
		$_t_FunctionTitle:="Jobs"
		If ($_bo_Query)
			Jobs_Sel($_t_FInd)
		End if 
	: ($_t_FunctionName="Project@")
		$_ptr_Table:=->[PROJECTS:89]
		$_t_FindOptions:="Project, Company or Contact to find:"  //see Projects_Sel - could be converted to a method to unify them
		$_t_FunctionTitle:="Projects"
		If ($_bo_Query)
			Projects_Sel($_t_FInd)
		End if 
		//************************************************************************************
		
	Else 
		$_t_FunctionTitle:="Nothing"
		$_t_FindOptions:="n/a"
		$_l_RecordsinSelection:=0
		$_t_FInd:=""
		$_ptr_Table:=->[COMPANIES:2]
End case 

//DEFAULT TABLE($_ptr_Table->)

If ($_bo_Query)
	$_l_RecordsinSelection:=Records in selection:C76($_ptr_Table->)
	If ($_l_RecordsinSelection>0)
		IME_DBList("DBList"+$_t_FunctionName)  //divert to draw the list page
		$_bo_Draw:=False:C215
	Else 
		$_t_ErrorText:="No "+$_t_FunctionTitle+" found"
		$_l_RecordsinSelection:=Records in table:C83($_ptr_Table->)
	End if 
Else 
	$_l_RecordsinSelection:=Records in table:C83($_ptr_Table->)
End if 


If ($_bo_Draw)
	
	IME_DBHeader("Find "+$_t_FunctionTitle; $_t_Direct; "Find "+$_t_FunctionTitle; "from "+String:C10($_l_RecordsinSelection); $_t_Direct)
	
	If ($_t_ErrorText#"")
		IME_ReplyText2("ITX DGTextError"; $_t_ErrorText)
	End if 
	
	IME_ReplyText2("ITX DGFind"; $_t_FindOptions; "find"; $_t_FInd; "32"; "100")  //user-definable Macro that draws the find box
	
	IME_ReplyText2("ITX DGButtFind")
	
	IME_DBFooter
	
End if 

UNLOAD RECORD:C212
ERR_MethodTrackerReturn("IME_DBFind"; $_t_oldMethodName)