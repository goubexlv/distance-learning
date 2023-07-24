@extends("layouts.user")

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Results of your EXAMINATION</div>
                @foreach(auth()->user()->classes as $level)
                <div class="card-body">
                    <p class="mt-5" style="text-align: center; font-weight: bold; font-style: italic; color: black;">Filière : {{ ucwords($level->field->name) }} &emsp;&emsp;&emsp; Niveau : {{ ucwords( $level->name) }}</p><br>
                    <table class="table table-bordered" style="text-align: center; ">
                        <thead class="thead-dark">
                          <tr>
                            <th scope="col">Code UE</th>
                            <th scope="col">Title</th>
                            <th scope="col">CC/20</th>
                            <th scope="col">TP/40</th>
                            <th scope="col">SN/40</th>
                            <th scope="col">total/100</th>
                          </tr>
                        </thead>
                        <tbody>
                            @foreach($results as $result)
                          <tr>
                            <th scope="row">{{ $result->code }}</th>

                            <td><?php echo $titre[ $result->code ] ?> </td>
                            <td><?php echo $notecc[ $result->code ] ?></td>
                            <td><?php echo $notetp[ $result->code ]*2 ?></td>
                            <td>{{ $result->total_points*2 }}</td>
                            <td> <?php echo $notecc[ $result->code ] + ($notetp[ $result->code ]*2) + ($result->total_points*2 )?> </td>
                          </tr>
                          @endforeach
                      </table>
                </div>
                @endforeach
            </div>
        </div>
    </div>
</div>
@endsection
