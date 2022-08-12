If (False:C215)
	//Table Form Method Name: [DOCUMENTS]dask_Cont
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:32
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; ch1; r1; r2; r3)
	C_TEXT:C284($_t_oldMethodName; vAnalysis; vOmit; vSource_; vStatus_; vType_)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].dask_Cont"; Form event code:C388)
//dask_Cont
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DOCUMENTS:7]); "dask_Cont")
		r3:=1
		ch1:=1
		OBJECT SET TITLE:C194(ch1; "Not applicable")
		OBJECT SET ENABLED:C1123(ch1; False:C215)
		vOmit:="N"
		vStatus_:=""
		vType_:=""
		vSource_:=""
		vAnalysis:=""
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(Current process)
	: ($_l_event=On Data Change:K2:15)
		Case of 
			: (r1=1)
				OBJECT SET TITLE:C194(ch1; "Revert to Analyses then First if none found")
				OBJECT SET ENABLED:C1123(ch1; True:C214)
			: (r2=1)
				OBJECT SET TITLE:C194(ch1; "Revert to Job Title then First if none found")
				OBJECT SET ENABLED:C1123(ch1; True:C214)
			Else 
				OBJECT SET TITLE:C194(ch1; "Not applicable")
				OBJECT SET ENABLED:C1123(ch1; False:C215)
		End case 
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[DOCUMENTS:7])
		
End case 
ERR_MethodTrackerReturn("FM [DOCUMENTS].dask_Cont"; $_t_oldMethodName)
