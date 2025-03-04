//
//  ContentView.swift
//  To-Do List
//
//  Created by StudentPM on 2/28/25.
//

import SwiftUI

struct ContentView: View {
    @State var listItemNum: Int = 0 //the number of tasks in the list
    @State var task: String = "" //this is for the text field, whatever is typed in it comes up here
    @State private var listItems: [String] = [] //this is store the tasks that should end up in list
    
    
    var body: some View {
        VStack {
            //Title
            Text("To-Do List")
                .bold()
                .font(.system(size: 40))
                .padding()
        }
        HStack{
            //To show what is supposed to display
            Text("Number of tasks:")
            Text("\(listItemNum)")
        }
        VStack{
            //A text field to enter the task you want to add to the list
            TextField("Enter a new task", text: $task)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 350)
                .padding()
        }
        HStack{
            //this button is meant to add a task
            Button(action: {addTask()}, label: {
                Text("Add Task")
                    .padding(15)
                    .background(task.isEmpty ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5.0)
                
            })
            .disabled(task.isEmpty) //this button becomes disabled when the text field is empty
            
            //this button is meant to remove all tasks from the list
            Button(action: {removeAllTasks()}, label: {
                Text("Remove All Tasks")
                    .padding(15)
                    .background(listItems.isEmpty ? Color.gray : Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(5.0)
            })
            .disabled(listItems.isEmpty) //this button becomes disabled when the array is empty
            
        }
        VStack{
            List{
                //gives every task on the list the ability to be deleted individually
                ForEach(listItems, id:\.self){ item in
                    Text(item)
                }
                .onDelete(perform: deleteItem)
            }
        }
        .padding()
    }
    
    // This function is meant to add a task to the list
    func addTask(){
        // Adds 1 to the number of tasks in the list
        listItemNum += 1
        // appends the task entered by the user to the array
        listItems.append(task)
    }
    
    //This function removes all the tasks in the list
    func removeAllTasks(){
        //sets number of tasks to 0
        listItemNum = 0
        //empties the array so no tasks show up on the list
        listItems = []
    }
    
    //this function is meant to delete a chosen task by the user
    func deleteItem(offset: IndexSet){
        listItems.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
