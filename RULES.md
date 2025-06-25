# Workspace Ruleset

A comprehensive guide to using and maintaining your `E:\` directory taxonomy. Follow these rules to ensure consistency, discoverability, and long-term integrity of all your files.

---

## 1. General Naming Conventions

1. **ASCII-only, No Spaces**  
   - Use underscores (`_`) to separate words.  
   - Avoid spaces, special characters, or case-sensitive differences.

2. **Date Prefixes**  
   - When a folder or file is date-specific, prefix with `YYYY-MM-DD_` or `YYYY-MM_` (e.g. `2025-06_ProjectReport.pdf`).

3. **Priority Prefixes**  
   - Use `@` to mark highest-priority items (they sort to top).  
   - Use `zzz_` or `ZZZ_` to push low-priority or “on hold” items to bottom.

4. **Consistent Abbreviations**  
   - University courses: use the official course code (e.g. `CS101`).  
   - Clients: use short unique names (e.g. `AcmeCorp`).

---

## 2. File Intake & Processing (`00_INBOX`)

- **00_INBOX\_TO_PROCESS**  
  - All new downloads, screenshots, email attachments, and temporary files must land here first.

- **00_INBOX\_STAGING**  
  - After a quick review, move items here while deciding their final home.  
  - Do not leave files here for more than **24 hours**.

- **Processing Cadence**  
  1. **Daily**, empty `00_INBOX\_TO_PROCESS` into `00_INBOX\_STAGING`.  
  2. **Weekly**, file or archive everything in `_STAGING`.  

---

## 3. Life Vision & Goals (`01_HORIZONS`)

- **10_LIFE_AND_LEGACY**  
  - Store your mission statements, personal manifesto, and “north star” documents.

- **20_GOALS**  
  - Subfolders `_ACTIVE` and `_ACHIEVED`.  
    - Move goals from `_ACTIVE` to `_ACHIEVED` upon completion.  
    - Archive old goals by year with date prefixes.

---

## 4. Projects (`02_PROJECTS`)

### 4.1 Active Projects (`_ACTIVE`)

- **COMMISSIONED_[Client]_[Name]/**  
  - Always begin with `COMMISSIONED_`.  
  - Five subfolders numbered `0_`→`4_` dictate workflow stage.  
  - Rename or copy entire folder to `_ARCHIVED` when finished.

- **UNI_[CourseCode]_[ProjectName]/**  
  - Use official course code.  
  - No additional status folders; priority via prefixes if needed.

- **PERSONAL_[ProjectName]/**  
  - Prefix `PERSONAL_` to distinguish personal side-projects.

### 4.2 Archived Projects (`_ARCHIVED`)

- Mirror `_ACTIVE` naming but no longer modify contents.  
- Use for paused or fully completed work.  
- **Do not** duplicate projects here; always **move**, not copy.

---

## 5. Areas of Responsibility (`03_AREAS`)

- **31_PROFESSIONAL**, **32_PERSONAL**, **33_LEARNING_AND_SKILLS**, **34_LEISURE_AND_PASSIONS**  
  - Each area is an ongoing domain—never “completed.”  
  - Subfolders under each capture different facets (e.g. `HEALTH_AND_WELLNESS`, `FORMAL_EDUCATION`).

- **Formal Education**  
  - Under `FORMAL_EDUCATION`, use one folder per academic year, then course code, then exactly these five subfolders:  
    1. `Lectures`  
    2. `Readings`  
    3. `Labs`  
    4. `Assignments`  
    5. `Notes`

- **Research & Skill Development**  
  - Maintain clear separation: `UNIVERSITY_RESEARCH`, `SKILL_DEVELOPMENT`, `INTERESTS`.

---

## 6. Resources (`04_RESOURCES`)

- **41_KNOWLEDGE_BANK**  
  - Articles, papers, books, courses, quotes.  
  - Tag or prefix course-specific research with `IT_` (e.g. `IT_RESEARCH`).

- **42_MEDIA_LIBRARY**  
  - Subdivide into `AUDIO`, `DOCUMENTS`, `IMAGES` (with `Wallpapers`), `VIDEO`, `FONTS_AND_ICONS`.

- **43_TEMPLATES_AND_ASSETS**  
  - Keep only blank (master) templates here.  
  - Version changes by date in filename (e.g. `Report_Template_v2025-06.md`).

- **44_SOFTWARE_AND_CONFIG**  
  - `APPLICATIONS`: installers & portable apps.  
  - `CODE_LIBRARY`: snippets, modules, packages.  
  - `CONFIG_FILES`: dotfiles & environment configs.  
  - `VIRTUAL_MACHINES`: snapshots, ISOs.

---

## 7. Creations & Outputs (`05_OUTPUTS`)

- **_DRAFTS_AND_IDEAS**  
  - Active work-in-progress: sketches, mind-maps, unpolished drafts.

- **_FINAL**  
  - Only polished, shareable outputs.  
  - Archive older finals by date if versioning is required.

---

## 8. Archival (`09_ARCHIVE`)

- **90_VAULT**  
  - Immutable records: identity docs, legal contracts, tax returns, warranties.  
  - **Do not modify** once placed here—treat as read-only.

- **91_PROJECTS_ARCHIVE**  
  - Deep store for moved projects from `02_PROJECTS\_ARCHIVED`.  
  - Organise by year if volume exceeds 20 items.

- **92_AREAS_ARCHIVE**  
  - Yearly snapshots of each `03_AREAS` domain (e.g. `2024_33_LEARNING_AND_SKILLS_Backup`).  
  - Run archiving annually or when a major life phase ends.

---

## 9. Maintenance & Automation

1. **Daily**  
   - Empty `00_INBOX\_TO_PROCESS` → `00_INBOX\_STAGING`.  
   - Confirm no files older than 7 days remain in `_STAGING`.

2. **Weekly**  
   - File everything in `_STAGING` to final destinations.  
   - Review `_ACTIVE` projects for progress; archive if dormant > 30 days.

3. **Monthly**  
   - Run disk usage report on top 5 largest folders; archive or delete obsolete items.

4. **Quarterly**  
   - Backup `E:\` to external drive or cloud.  
   - Validate integrity of `90_VAULT` (checksum verification).

5. **Yearly**  
   - Create snapshots for `92_AREAS_ARCHIVE` and `91_PROJECTS_ARCHIVE`.  
   - Purge `01_HORIZONS\20_GOALS\_ACHIEVED` entries older than 5 years.

---

## 10. Tagging & Metadata (Optional)

- Use Windows file properties (“Tags” field) for cross-category retrieval (e.g. `#urgent`, `#reference`, `#client:AcmeCorp`).  
- Maintain a simple `tags.csv` at `04_RESOURCES\41_KNOWLEDGE_BANK\` mapping file paths to tags for quick lookup.

---

## 11. Symlinks & Shortcuts

- For cross-domain needs (e.g. a project that spans personal & university), use NTFS symbolic links or Windows shortcuts—**never** duplicate files.

- Maintain a `Today` folder in your **Quick Access** toolbar containing links to the most active subfolders (e.g. your top three `_ACTIVE` projects).

---

> **Remember:**  
> - Consistency is more important than perfection.  
> - A clean, predictable structure is a force multiplier for productivity.  
> - Adapt these rules sparingly—only when a genuine new requirement arises.  
> - Trust the structure but exercise judgment when categorizing edge cases.  
> - Regular maintenance prevents entropy—schedule it like you would any other appointment.
