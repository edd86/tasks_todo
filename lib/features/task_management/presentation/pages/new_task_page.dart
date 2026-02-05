import 'package:flutter/material.dart';
import 'package:tasks_todo/core/presentation/widgets/custom_text_field.dart';
import 'package:tasks_todo/features/task_management/data/tasks_enum.dart';
import 'package:tasks_todo/features/task_management/presentation/widgets/category_chip.dart';
import 'package:tasks_todo/features/task_management/presentation/widgets/date_time_card.dart';
import 'package:tasks_todo/features/task_management/presentation/widgets/priority_item.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({super.key});

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final _titleController = TextEditingController();
  final _notesController = TextEditingController();

  CategoriesEnum _selectedCategory = CategoriesEnum.work;
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;
  String _selectedPriority = 'Medium';

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  String get _dateString {
    final now = DateTime.now();
    final isToday =
        _selectedDate.year == now.year &&
        _selectedDate.month == now.month &&
        _selectedDate.day == now.day;
    if (isToday) return 'Today';
    return '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}';
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final categories = CategoriesEnum.values;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Text(
                      'Create New Task',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // Balance for back button
                ],
              ),
            ),

            // White Container (Body)
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Form Fields
                      CustomTextField(
                        controller: _titleController,
                        label: 'TASK NAME',
                        hintText: 'What needs to be done?',
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a task name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _notesController,
                        label: 'NOTES',
                        hintText: 'Add details or subtasks...',
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        isMultiLine: true,
                      ),

                      const SizedBox(height: 30),

                      // Category
                      const Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      SizedBox(
                        height: 50,
                        child: ListView.separated(
                          itemCount: categories.length,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: size.width * 0.15),
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            final isSelected = category == _selectedCategory;
                            return CategoryChip(
                              category: category,
                              isSelected: isSelected,
                              primaryColor: primaryColor,
                              onTap: () {
                                setState(() {
                                  _selectedCategory = category;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Date & Time
                      Row(
                        children: [
                          Expanded(
                            child: DateTimeCard(
                              label: 'TIME',
                              value: _selectedTime.format(context),
                              icon: Icons.access_time_filled,
                              iconColor: primaryColor,
                              onTap: _pickTime,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: DateTimeCard(
                              label: 'DATE',
                              value: _dateString,
                              icon: Icons.calendar_today,
                              iconColor: primaryColor,
                              onTap: _pickDate,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // Priority
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            PriorityItem(
                              label: 'Low',
                              isSelected: _selectedPriority == 'Low',
                              onTap: () =>
                                  setState(() => _selectedPriority = 'Low'),
                            ),
                            PriorityItem(
                              label: 'Medium',
                              isSelected: _selectedPriority == 'Medium',
                              onTap: () =>
                                  setState(() => _selectedPriority = 'Medium'),
                            ),
                            PriorityItem(
                              label: 'High',
                              isSelected: _selectedPriority == 'High',
                              onTap: () =>
                                  setState(() => _selectedPriority = 'High'),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Save Button
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check_circle, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'Save Task',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
