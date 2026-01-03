from django.shortcuts import render

list #sorted by order
# Create your views here.
def delay(time_to_add, task_id):
    new_list = deepcopy(original_list)
    
    target = find_task_by_id(new_list, task_id)
    target.start_time += time_to_add
    
    for i in range(target_index, len(new_list) - 1):
        current = new_list[i]
        next_task = new_list[i+1]
        
        if current.end_time > next_task.start_time:
            if next_task.hard == False:
                next_task.start_time = current.end_time
            else:
                return call_gemini_to_fix(new_list, context)
                
    save_to_db(new_list)

def add(new_node):
    new_list = deepcopy(original_list)
    
    insert_idx = 0
    for i, task in enumerate(new_list):
        if task.start_time > new_node.start_time:
            insert_idx = i
            break

    new_list.insert(insert_idx, new_node)

    if insert_idx + 1 < len(new_list):
        next_task = new_list[insert_idx + 1]

        if new_node.end_time > next_task.start_time:
            overlap = new_node.end_time - next_task.start_time
            return delay(overlap, next_task.id) 

    save_to_db(new_list)

def delete(task_id):
    new_list = deepcopy(original_list)
    
    target = find_task_by_id(new_list, task_id)
    for(items in new_list):
        if items.id == task_id:
            list.delete(items)
            break
    
                
    save_to_db(new_list)