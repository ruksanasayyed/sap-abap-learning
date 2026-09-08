# ⚙️ Chapter 04 – ABAP Syntax & Internal Tables

> **From writing basic ABAP statements to processing real business data.**
>
> This chapter is where I started moving from SAP Dictionary concepts into practical ABAP programming.

---

## 🧭 What This Chapter Covers

Instead of keeping this as a list of definitions, I'm documenting the concepts I actually practiced and the problems they helped me solve.

| Area | What I Practiced |
| --- | --- |
| 🧱 ABAP Basics | Variables, data types, constants, system fields |
| 🗃️ Internal Tables | Standard, Sorted, Hashed tables and Work Areas |
| 🔧 Table Operations | APPEND, INSERT, LOOP, MODIFY, DELETE, SORT, READ TABLE |
| ➕ Data Processing | COLLECT, SY-SUBRC, SY-TABIX |
| 🔀 Control Flow | IF, ELSE, CASE, DO, WHILE, EXIT, CONTINUE |
| 📊 Reporting | Selection screens and Control Break Statements |
| 🔤 Strings | CONCATENATE, SPLIT, CLEAR |
| 🧩 Program Structure | FORM, PERFORM and report events |

---

# 🧱 ABAP Basics

### Variables

Variables are used as storage locations for values during program execution.

I also started following naming conventions to make the purpose and scope of variables easier to understand.

| Prefix | Example | Meaning |
| --- | --- | --- |
| `gv_` | `gv_name` | Global variable |
| `lv_` | `lv_name` | Local variable |
| `gt_` | `gt_employee` | Global internal table |
| `lt_` | `lt_employee` | Local internal table |

> 💡 These prefixes are naming conventions. They help readability but are not mandatory ABAP syntax rules.

---

### Data Types

I practiced the following elementary ABAP data types:

| Type | Purpose |
| --- | --- |
| `C` | Character / text |
| `N` | Numeric text |
| `I` | Integer |
| `P` | Packed number, commonly used for calculations and decimal values |
| `D` | Date |
| `T` | Time |

---

### Constants

A constant stores a fixed value that cannot be assigned a new value during program execution.

A constant can still be referenced multiple times.

---

### System Fields

ABAP provides predefined `SY-*` fields that contain runtime information.

| System Field | Use |
| --- | --- |
| `SY-DATUM` | Current date |
| `SY-UZEIT` | Current time |
| `SY-UNAME` | Current SAP user |
| `SY-SUBRC` | Return code of the previous operation |
| `SY-TABIX` | Current internal table index in relevant processing |

---

# 🗃️ Internal Tables

> **My key understanding:**  
> An internal table is temporary runtime storage used by an ABAP program to hold and process multiple records. It is not the same as a persistent database table.

### Internal Table vs Database Table

| Internal Table | Database Table |
| --- | --- |
| Exists during program/runtime processing | Persistent database storage |
| Used to process data in ABAP | Used to store business data |
| Temporary | Persistent |

---

## 📦 Work Areas

A **work area** holds one record at a time, while an internal table can contain multiple records.

For example:

`GT_EMPLOYEE` → multiple records  
`GS_EMPLOYEE` → one record

A common pattern is:

`LOOP AT gt_employee INTO gs_employee.`

I also practiced using `CLEAR` when reusing work areas.

---

## 🧰 Internal Table Types

### Standard Table

A standard internal table is a commonly used table type that does not automatically maintain records in sorted key order.

### Sorted Table

A sorted internal table automatically maintains records according to its table key.

Example:

`TYPE SORTED TABLE OF rt_emp WITH NON-UNIQUE KEY employee_id company_code`

### Hashed Table

A hashed internal table uses a unique key for key-based access.

Example:

`TYPE HASHED TABLE OF rt_emp WITH UNIQUE KEY employee_id company_code`

---

# 🔧 Internal Table Operations

These are the operations I practiced while working with internal tables.

| Statement | My Understanding |
| --- | --- |
| `APPEND` | Adds a record to an internal table |
| `INSERT` | Inserts a record into an internal table |
| `LOOP AT` | Processes internal table records |
| `MODIFY` | Changes existing records |
| `DELETE` | Removes records |
| `SORT` | Sorts internal table records |
| `READ TABLE` | Reads a record from an internal table |
| `DESCRIBE TABLE` | Provides information about the internal table |
| `DELETE ADJACENT DUPLICATES` | Removes adjacent duplicate records |
| `COLLECT` | Inserts or aggregates records according to the table key |

---

# 🔎 READ TABLE

`READ TABLE` is used to retrieve records from an internal table.

I practiced:

- Linear search
- Binary search
- Reading by index
- Key-based reading

After operations such as `READ TABLE`, I also practiced checking `SY-SUBRC` to determine whether the operation was successful.

---

# ➕ COLLECT

`COLLECT` is an internal table statement used to insert or aggregate records according to the table key.

When a matching key already exists, numeric fields can be aggregated instead of creating another separate record.

I practiced this using employee data such as:

**Department + Company Code → CTC aggregation**

---

# 🔀 Control Statements

Control statements control the flow of an ABAP program.

### Decision Making

`IF`  
`IF ... ELSE`  
`IF ... ELSEIF ... ELSE`  
`CASE`

I also practiced combining conditions using:

`AND` and `OR`

and working with nested conditions.

### Loops

`DO ... ENDDO`  
`WHILE ... ENDWHILE`

### Loop Control

`EXIT` → leaves the loop

`CONTINUE` → skips the current iteration and continues with the next iteration

---

# 📊 Control Break Statements

This was my first practical report using **group-based processing**.

Control break statements are used inside `LOOP ... ENDLOOP` to process groups of records based on field values.

They are useful for:

- Printing headers
- Detecting the beginning of a group
- Calculating subtotals
- Calculating grand totals

### The Four I Practiced

| Statement | What I Understand |
| --- | --- |
| `AT FIRST` | Runs once at the beginning of internal table processing |
| `AT NEW field` | Runs when a new value/group of the specified field starts |
| `AT END OF field` | Runs when the current group reaches its end |
| `AT LAST` | Runs once at the end of the internal table |

### How They Work Together

For my Purchase Order report, I sorted the internal table using:

`SORT gt_ekpo BY ebeln ebelp.`

This groups the purchase-order items by `EBELN`.

The processing becomes:

**AT FIRST**  
↓  
Print column headings

**AT NEW EBELN**  
↓  
A new Purchase Order group starts

**Process PO items**

**AT END OF EBELN**  
↓  
Current Purchase Order finishes  
↓  
Calculate PO subtotal

**Next Purchase Order**

**AT LAST**  
↓  
All Purchase Orders are finished  
↓  
Calculate grand total

---

## 🧮 SUM

`SUM` is used to calculate totals of numeric fields in the relevant internal-table processing context.

In my report:

`AT END OF EBELN` → calculates the individual PO total

`AT LAST` → calculates the total across all processed POs

> 🧠 **Simple mental model:**  
> `AT NEW` = group starts  
> `AT END OF` = group finishes  
> `AT LAST` = everything finishes

---

# 🔤 String Operations

I practiced basic string manipulation using:

### `CONCATENATE`

Combines multiple values into a single string.

### `SPLIT`

Splits a string using a specified separator.

I also practiced splitting comma-separated values directly into an internal table.

### `CLEAR`

Clears the current value of a data object.

---

# 🖥️ Selection Screens

I practiced creating selection screens using `SELECT-OPTIONS`.

Example:

`SELECT-OPTIONS: s_ebeln FOR gv_ebeln.`

This allows the user to provide selection criteria before the report processes the data.

---

# 🧩 Program Structure

I practiced classical ABAP report events and subroutines.

### Report Events

`START-OF-SELECTION`

Used for the main processing of a classical report.

`END-OF-SELECTION`

Marks the end of the main selection-processing event.

### Subroutines

`FORM ... ENDFORM`

Defines a subroutine.

`PERFORM`

Calls the subroutine.

---

# 🛠️ Practice Programs

| Program | Focus |
| --- | --- |
| `ZABAP_INTERNAL_TABLES_SYNTAX` | Internal table declaration and operations |
| `ZABAP_COLLECT_SYNTAX` | `COLLECT` and numeric aggregation |
| `ZABAP_SORTED_TABLE_SYNTAX` | Sorted internal tables |
| `ZABAP_HASHED_TABLE_SYNTAX` | Hashed internal tables |
| `ZABAP_CONDITIONAL_STATEMENTS` | Conditions, loops, `EXIT`, `CONTINUE`, parameters and subroutines |
| `ZABAP_STRING_OPERATIONS` | `CONCATENATE`, `SPLIT`, `CLEAR` |
| `ZABAP_CONTROL_BREAK_STATEMENTS` | Control-break processing and Purchase Order report |

All practice programs are available in the `src` folder.

---

# 📸 Practical Output

### Control Break Statements Report

The report processes Purchase Order data from `EKPO` and displays:

- Purchase Order items
- PO-level totals
- Grand total of processed Purchase Orders

![Control Break Statements Output](screenshots/control-break-statements-output.png)

---

# 🧠 Engineering Takeaways

This chapter helped me move from learning individual ABAP statements to understanding how those statements work together in a program.

Some important things I learned:

- Internal tables are runtime data structures used for processing multiple records.
- Different internal table types are suited to different access patterns.
- Work areas represent individual records during processing.
- Keys become important when working with sorted, hashed, and aggregated data.
- `SY-SUBRC` helps determine whether certain operations were successful.
- Control-break statements make grouped report processing possible.
- Sorting the data correctly is important when using control-break processing.
- ABAP syntax becomes much easier to understand when I actually use it in small programs.

---

> 🧪 **Learning method:** Learn → Apply → Make Mistakes → Ask Questions → Improve
>
> This chapter is an ongoing collection of practical ABAP experiments and engineering notes.