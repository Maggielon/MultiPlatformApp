package me.anastasia.androidApp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import me.anastasia.shared.*
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.LinearLayoutManager
import kotlinx.coroutines.*

class MainActivity : AppCompatActivity(), CoroutineScope {

    private val job = Job()
    override val coroutineContext = job + Dispatchers.Main

    private var list: RecyclerView? = null
    private var adapter = RecipesAdapter()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        list = findViewById<RecyclerView>(R.id.list)
        list?.layoutManager = LinearLayoutManager(this)
    }

    override fun onResume() {
        super.onResume()
        launch {
            val result = ListViewModel().list(ingredients = "", query = "", page = 1)
            onResult(result)
        }
    }

    fun onResult(result: RecipeList) {
        list?.adapter = adapter
        this.adapter.updateItems(result.results ?: emptyList())
    }
}
