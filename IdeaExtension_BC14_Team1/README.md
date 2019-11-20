# Application Ideas

### Publikace
V **Business Central Administration Shell**:
*Publikace*:  
`Publish-NAVApp -ServerInstance BC140CZ -Path "Cesta_k_Suggestions_1.0.0.0.app_souboru" -SkipVerification`

*Synchronizace*:  
`Sync-NavApp -ServerInstance BC140CZ -Name Suggestions -Version 1.0.0.0 -Tenant default`
V tomto případě, kdy nemáme instanci serveru s více klienty, lze použít jako parametr *Tenant* default

*Instalace*:  
`Install-NAVApp -ServerInstance BC140CZ -Name ”Suggestions” –Tenant default`

Instalaci lze též porvést i přes web, a to na stránce **Správa rozšíření**
---
Nutno vytvořit záznamy v těchto tabulkách pro fungování extensionu:
- **Category Filter Dialog Table** (vytvoření 1. záznamu)   
 - **Categories Table** - Vytvoření záznamů kategorií

Manuálnímu vytváření těchto nezbytných dat by se šlo při instalaci vyhnout inicializací dat pomocí metody `Init()` v instalačním procesu aplikace.

Nutno též vytvořit číselnou řadu a přiřadit ji na **Application Ideas Setup page**.  
Je také třeba vytvořit záznam pro uživatele na stránce **User Setup** a zaškrtnout přidané pole `Allow Application Ideas Setup` pro editaci stránky **Application Ideas Setup**.

Pro fungování odstranění hlasu při existenci pouze jediného hlasu nad pouze jedním záznamem tabulka se záznamy hlasování nemůže být prázdná. Toto lze též vyřešit pomocí inicializace dat při instalaci aplikace; Vytvořením 1. záznamu nepřiřazeného žádnému uživateli, s hodnotou `No vote`.

*Kategorie **Experience Dynamics 365 Application Ideas**:*

```
 Data Migrations  
 Development  
 Documentation  
 Financial Management  
 General  
 Geographies and Localization  
 Inventory  
 Manufacturing  
 Office Integration  
 Opportunity Management  
 Project Management  
 Purchasing  
 Reports and Business Intelligence  
 Sales  
 Service Order Management  
 Tenant Administration  
 Warehousing
 ```
