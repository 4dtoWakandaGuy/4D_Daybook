//%attributes = {}
If (False:C215)
	//Project Method Name:      TICK_IMPORT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Types; 0)
	C_LONGINT:C283(<>CreditIMPProcID; <>CustomerIMPProcID; <>InvoiceIMPProcID; <>SUpplierIMPProcID; $_l_PathTest)
	C_TEXT:C284(<>CreditIMPFile; <>CustomerIMPFile; <>InvoiceIMPfile; <>SupplierIMPFile; $_t_CurrentActiveDirectory; $_t_DocumentName; $_t_oldMethodName)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TICK_IMPORT")
//This is especially for TICK TOCK PUBLISHING
//We have to import
//customers
//suppliers
//orders
//credits

ARRAY TEXT:C222($_at_Types; 1)

If (Is Windows:C1573)
	$_at_Types{1}:="TXT"
Else 
	$_at_Types{1}:="TEXT"
End if 
$_t_CurrentActiveDirectory:=Get 4D folder:C485
$_t_CurrentActiveDirectory:=PathFromPathName($_t_CurrentActiveDirectory)


If (<>CustomerIMPProcID=0)  //Process_Not running
	//Get path to customer import document
	$_t_DocumentName:=$_t_CurrentActiveDirectory+"CustImport.TXT"
	$_l_PathTest:=Test path name:C476($_t_DocumentName)
	If ($_l_PathTest=1)
		$_ti_DocumentRef:=DB_OpenDocument($_t_DocumentName; "TEXT")
		RECEIVE PACKET:C104($_ti_DocumentRef; <>CUstomerIMPFile; Char:C90(13))
		If (<>CUstomerIMPFile="")
			// ALERT("Select the customer import file")
			Gen_Alert("Select the customer import file.")
			//$OK:=@XX_AP Select document (◊CUstomerIMPFile;$_at_Types)
		End if 
		SEND PACKET:C103($_ti_DocumentRef; <>CUstomerIMPFile)
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	Else 
		//   ALERT("Select the customer import file")
		Gen_Alert("Select the customer import file.")
		//$OK:=@XX_AP Select document (◊CUstomerIMPFile;$_at_Types)
		$_ti_DocumentRef:=DB_CreateDocument($_t_DocumentName; "TEXT")
		SEND PACKET:C103($_ti_DocumentRef; <>CUstomerIMPFile)
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	End if 
	If (<>CUstomerIMPFile#"")
		<>CustomerIMPProcID:=New process:C317("TICK_IMPORT_CUSTOMERS"; DB_ProcessMemoryinit(8); "Import Customers"; <>CUstomerIMPFile)
	Else 
		//  ALERT("THE CUSTOMER IMPORT CANNOT WORK WITHOUT A DOCUMENT!")
		Gen_Alert("THE CUSTOMER IMPORT CANNOT WORK WITHOUT A DOCUMENT!")
	End if 
End if 

//`````````````````
If (<>SupplierIMPProcID=0)
	//Get path to supplier import document
	$_t_DocumentName:=$_t_CurrentActiveDirectory+"Suppliermport.TXT"
	$_l_PathTest:=Test path name:C476($_t_DocumentName)
	If ($_l_PathTest=1)
		$_ti_DocumentRef:=DB_OpenDocument($_t_DocumentName; "TEXT")
		RECEIVE PACKET:C104($_ti_DocumentRef; <>SupplierIMPFile; Char:C90(13))
		If (<>SupplierIMPFile="")
			//  ALERT("Select the supplier import file")
			Gen_Alert("Select the supplier import file.")
			//$OK:=@XX_AP Select document (◊SupplierIMPFile;$_at_Types)
		End if 
		SEND PACKET:C103($_ti_DocumentRef; <>SupplierIMPFile)
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	Else 
		//  ALERT("Select the supplier import file")
		Gen_Alert("Select the supplier import file.")
		//$OK:=@XX_AP Select document (◊SupplierIMPFile;$_at_Types)
		$_ti_DocumentRef:=DB_CreateDocument($_t_DocumentName; "TEXT")
		SEND PACKET:C103($_ti_DocumentRef; <>SupplierIMPFile)
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	End if 
	If (<>SupplierIMPFile#"")
		<>SupplierIMPProcID:=New process:C317("TICK_IMPORT_SUPPLIERS"; DB_ProcessMemoryinit(1); "Import Suppliers"; <>SupplierIMPFile)
	Else 
		//  ALERT("THE SUPPLIER IMPORT CANNOT WORK WITHOUT A DOCUMENT!")
		Gen_Alert("THE SUPPLIER IMPORT CANNOT WORK WITHOUT A DOCUMENT!")
	End if 
End if 

//`````````````````
If (<>InvoiceIMPProcID=0)
	//Get path to INVOICE import document
	$_t_DocumentName:=$_t_CurrentActiveDirectory+"Invoiceimport.TXT"
	$_l_PathTest:=Test path name:C476($_t_DocumentName)
	If ($_l_PathTest=1)
		$_ti_DocumentRef:=DB_OpenDocument($_t_DocumentName; "TEXT")
		RECEIVE PACKET:C104($_ti_DocumentRef; <>INVOICEIMPFile; Char:C90(13))
		If (<>INVOICEIMPFile="")
			//  ALERT("Select the invoice import file")
			Gen_Alert("Select the invoice import file:")
			//$OK:=@XX_AP Select document (◊invoiceIMPFile;$_at_Types)
		End if 
		SEND PACKET:C103($_ti_DocumentRef; <>INVOICEIMPFile)
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	Else 
		// ALERT("Select the invoice import file")
		Gen_Alert("Select the invoice import file:")
		//$OK:=@XX_AP Select document (◊INVOICEIMPFile;$_at_Types)
		$_ti_DocumentRef:=DB_CreateDocument($_t_DocumentName; "TEXT")
		SEND PACKET:C103($_ti_DocumentRef; <>INVOICEIMPFile)
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	End if 
	If (<>INVOICEIMPFile#"")
		<>INVOICEIMPProcID:=New process:C317("TICK_IMPORT_INVOICE"; DB_ProcessMemoryinit(1); "Import Invoices"; <>INVOICEIMPFile)
	Else 
		// ALERT("THE INVOICE IMPORT CANNOT WORK WITHOUT A DOCUMENT!")
		Gen_Alert("THE INVOICE IMPORT CANNOT WORK WITHOUT A DOCUMENT!")
	End if 
End if 

//`````````````````
If (<>CreditIMPProcID>0)
	//Get path to Credit import document
	$_t_DocumentName:=$_t_CurrentActiveDirectory+"Creditimport.TXT"
	$_l_PathTest:=Test path name:C476($_t_DocumentName)
	If ($_l_PathTest=1)
		$_ti_DocumentRef:=DB_OpenDocument($_t_DocumentName; "TEXT")
		RECEIVE PACKET:C104($_ti_DocumentRef; <>CreditIMPFile; Char:C90(13))
		If (<>CreditIMPFile="")
			//   ALERT("Select the Credit import file")
			Gen_Alert("Select the Credit import file:")
			//$OK:=@XX_AP Select document (◊CreditIMPFile;$_at_Types)
		End if 
		SEND PACKET:C103($_ti_DocumentRef; <>CreditIMPFile)
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	Else 
		//  ALERT("Select the Credit import file")
		Gen_Alert("Select the Credit import file:")
		//$OK:=@XX_AP Select document (◊CreditIMPFile;$_at_Types)
		$_ti_DocumentRef:=DB_CreateDocument($_t_DocumentName; "TEXT")
		SEND PACKET:C103($_ti_DocumentRef; <>CreditIMPFile)
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	End if 
	If (<>CreditIMPFile#"")
		<>CreditIMPProcID:=New process:C317("TICK_IMPORT_Credit"; DB_ProcessMemoryinit(1); "Import Credits"; <>CreditIMPFile)
	Else 
		//ALERT("THE Credit IMPORT CANNOT WORK WITHOUT A DOCUMENT!")
		Gen_Alert("THE Credit IMPORT CANNOT WORK WITHOUT A DOCUMENT!")
	End if 
End if 
ERR_MethodTrackerReturn("TICK_IMPORT"; $_t_oldMethodName)
