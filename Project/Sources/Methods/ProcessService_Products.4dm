//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessService_Products
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
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessService_Products")
//ProcessService_Products
// 27/11/03 pb
// Runs various methods called from trigger
$0:=True:C214

Case of 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="UpdateCatalogueLink")
		// produc record has been modified, so the Catalogue links (if they exist)
		// need to be flagged for updating to the BK
		QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]x_ProductID:3=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		APPLY TO SELECTION:C70([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]TimeDateStamp:8:=[PROCESSES_TO_HANDLE:115]Data1Longint:8)
		
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="DeleteCatalogueLink")
		// produc record has been deleted, so the Catalogue links (if they exist)
		// need to be flagged for updating to the BK
		QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]x_ProductID:3=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		Catalogue_FlagLinkfordeletion([PROCESSES_TO_HANDLE:115]Data1Longint:8)
End case 
ERR_MethodTrackerReturn("ProcessService_Products"; $_t_oldMethodName)
